import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:restaurant/signin_controller.dart';

class main_d extends StatefulWidget {
  const main_d({Key? key}) : super(key: key);

  @override
  _main_dState createState() => _main_dState();
}

class _main_dState extends State<main_d> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: 2 * w / 3,
      // ignore: unnecessary_new
      child: new ListView(
        children: <Widget>[
          Container(
              height: h / 5,
              color: Colors.green[100],
              child: new DrawerHeader(
                child: (Icon(Icons.person)),
              )),
          // ignore: unnecessary_new
          new Container(
            height: 4 * h / 5,
            color: Colors.blue[300],
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: new Icon(Icons.person),
                  title: Text(
                    'Sign In',
                    style:
                        GoogleFonts.openSans(color: Colors.black, fontSize: 20),
                  ),
                  // onTap: ()
                ),
                ListTile(
                  leading: new Icon(Icons.feedback),
                  title: Text(
                    'Feedback',
                    style:
                        GoogleFonts.openSans(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
