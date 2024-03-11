import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'maindrawer.dart';
import 'widgets/movi_img.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  List trendingmovies = [];
  List popularmovies = [];
  List moremovies = [];
  List topmovies = [];
  int currentIndex = 0;

  final String apiKey = 'YOUR_API_KEY';
  final readaccesstoken =
      'YOUR_READ_ACCESS_TOKEN';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map popularresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    //Map moreresult = await tmdbWithCustomLogs.v3.tv.getLatest();
    Map topresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    setState(() {
      trendingmovies = trendingresult['results'];
      popularmovies = popularresult['results'];
      //moremovies = moreresult['results'];
      topmovies = topresult['results'];
    });
    // print(trendingmovies);
    // print(somemovies);
  }

  Map<dynamic, dynamic> newMethod(Map<dynamic, dynamic> moreresult) =>
      moreresult;

  Widget build(BuildContext context) {
    var ScreenHeight = MediaQuery.of(context).size.height;
    var ScreenWidth = MediaQuery.of(context).size.width;
    final screens = [
      ListView(
        children: [
          TrendingMovies(trending: trendingmovies),
          Popular(popular: popularmovies),
          // moreitems(items: moremovies),
          TopRated(top: topmovies)
        ],
      ),
      saved(),
      Center(
        child: Text('No downloads yet', style: TextStyle(fontSize: 30)),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: !isSearching
            ? Text(
                'Movies ❤️',
                style: GoogleFonts.basic(),
              )
            : TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: ("Search your favourite shows here"),
                ),
              ),
        actions: [
          !isSearching
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = !this.isSearching;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = !this.isSearching;
                    });
                  },
                ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: main_d(),
      /*body: Container(
        height: ScreenHeight,
        width: ScreenWidth,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              recentmov(),
              movie2pic(),
              bollywood(),
              movie3pic(),
              hollywood(),
              movie4pic(),
              southindian(),
              movie5pic(),
              thriller(),
              movie6pic()
            ],
          ),
        )),
      ),*/
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
      ),
    );
  }
}

class saved extends StatelessWidget {
  const saved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          'Saved Items:',
          style: GoogleFonts.arsenal(color: Colors.black, fontSize: 30),
        ),
        Divider(
          color: Colors.red,
          height: 20,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
        Text(
          'List is empty',
          style: TextStyle(fontSize: 15, color: Colors.lightGreen),
        ),
      ],
    ));
  }
}
