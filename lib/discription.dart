import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchOn;
  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launchOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.grey,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              height: h / 3,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: h / 3,
                      width: w,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  name == " "
                      ? Positioned(
                          bottom: 5,
                          child: (Text(
                            '⭐Average Rating - ' + vote,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                backgroundColor: Colors.black12),
                          )),
                        )
                      : Container(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            name != " "
                ? Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            name,
                            style: GoogleFonts.robotoSlab(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '⭐' + vote,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              backgroundColor: Colors.green[900]),
                        ),
                      ),
                    ],
                  )
                : Container(),
            launchOn != " "
                ? Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Released On : ' + launchOn,
                      style: GoogleFonts.arsenal(
                          color: Colors.green[900], fontSize: 15),
                    ),
                  )
                : Container(),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    height: 2 * h / 7,
                    width: w / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(posterurl),
                            fit: BoxFit.cover))),
                Flexible(
                  child: Container(
                    child: Text(
                      description,
                      style:
                          GoogleFonts.neuton(color: Colors.black, fontSize: 15),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
