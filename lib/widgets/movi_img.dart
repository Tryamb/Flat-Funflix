import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/discription.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(2, 0, h / 36, h / 72),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recently Featured:',
                style:
                    GoogleFonts.robotoSlab(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Container(
            height: h / 4,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: w / 25,
                  );
                },
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                    name: trending[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    description: trending[index]['overview'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    launchOn: trending[index]
                                        ['release_date'])));
                      },
                      child: Container(
                          width: w / 3,
                          child: Column(
                            children: [
                              Container(
                                  height: h / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending[index]
                                                      ['poster_path']),
                                          fit: BoxFit.cover))),
                            ],
                          )));
                }),
          )
        ],
      ),
    );
  }
}

class Popular extends StatelessWidget {
  final List popular;

  const Popular({Key? key, required this.popular}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(2, 0, h / 36, h / 72),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Popular:',
                style:
                    GoogleFonts.robotoSlab(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Container(
            height: h / 4,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: w / 25,
                  );
                },
                itemCount: popular.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                    name: " ",
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            popular[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            popular[index]['poster_path'],
                                    description: popular[index]['overview'],
                                    vote: popular[index]['vote_average']
                                        .toString(),
                                    launchOn: " ")));
                      },
                      child: Container(
                          width: w / 3,
                          child: Column(
                            children: [
                              Container(
                                  height: h / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                popular[index]['poster_path']),
                                        fit: BoxFit.cover),
                                  )),
                            ],
                          )));
                }),
          )
        ],
      ),
    );
  }
}

class moreitems extends StatelessWidget {
  final List items;
  const moreitems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(2, 0, h / 36, h / 72),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('New:',
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
          ),
          Container(
            height: h / 4,
            child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {},
                      child: Container(
                          width: w / 3,
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(w / 25, 0, 0, 0),
                                  height: h / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  items[index]['poster_path']),
                                          fit: BoxFit.cover))),
                            ],
                          )));
                }),
          )
        ],
      ),
    );
  }
}

class TopRated extends StatelessWidget {
  final List top;
  const TopRated({Key? key, required this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(2, 0, h / 36, h / 72),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Rated Movies:',
                style:
                    GoogleFonts.robotoSlab(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Container(
            height: h / 4,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: w / 25,
                  );
                },
                itemCount: top.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                    name: top[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            top[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            top[index]['poster_path'],
                                    description: top[index]['overview'],
                                    vote: top[index]['vote_average'].toString(),
                                    launchOn: top[index]['release_date'])));
                      },
                      child: Container(
                          width: w / 3,
                          child: Column(
                            children: [
                              Container(
                                  height: h / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  top[index]['poster_path']),
                                          fit: BoxFit.cover))),
                            ],
                          )));
                }),
          )
        ],
      ),
    );
  }
}
