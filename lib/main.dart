import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: NazwaKlasyStateful("Piłkarz"),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class NazwaKlasyStateful extends StatefulWidget {
  final String title;

  NazwaKlasyStateful(this.title);

  @override
  _NazwaKlasyStatefulState createState() => _NazwaKlasyStatefulState();
}

class _NazwaKlasyStatefulState extends State<NazwaKlasyStateful> {
  int number = 1;
  int number2 = 1;
  int number3 = 1;
  String photo =
      "https://cdn.ussoccer.com/-/media/project/ussf/players/mnt/jozy-altidore/altidore2-sitecoredata.ashx?h=580&la=en-US&w=580&rev=4c1254db1fb149bc930bbbbef0911ee8&hash=5F72F12CBA67B397F421ACC716B5B722";
  var primary = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: TextButton(
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: CircleAvatar(
                          radius: 60, backgroundImage: NetworkImage(photo)),
                      onPressed: () {
                        setState(() {
                          if (number2 == 0) {
                            photo =
                            "https://marriedbiography.com/wp-content/uploads/2017/06/pepe-1.jpg";
                            number2++;
                          } else {
                            photo =
                            "http://4.bp.blogspot.com/--IBryZ4h-6Y/VXrj-CuV69I/AAAAAAAABoE/0gppELnOVsQ/s1600/pepe.jpg";
                            number2 = 0;
                          }
                        });
                      }),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Képler Laveran Pepe",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Text(
                      "Portugalski piłkarz pochodzenia brazylijskiego, występujący na pozycji obrońcy. Obecnie jest zawodnikiem FC Porto.",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Moja ocena:",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: StarsRow(number),
                            onPressed: () {
                              setState(() {
                                if (number == 3) {
                                  number = 0;
                                }
                                number++;
                              });
                              ;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  white_box(
                      Icons.child_care, "26.02.1983r.", Icons.bolt, "9.10.2004"),
                  white_box(Icons.star_border_rounded, "FC Porto", Icons.star,
                      "FC Porto"),
                  white_box(
                      Icons.arrow_upward, "1,78 m", Icons.open_in_full, "2,5 dziabrzdyla"),
                ],
              )),
          onPressed: () {
            setState(() {
              if (number3 == 0) {
                primary = Colors.blueGrey;
                number3++;
              } else {
                primary = Colors.grey;
                number3 = 0;
              }
            });
          }),
    );
  }
}

class StarsRow extends StatefulWidget {
  final int rating;

  const StarsRow(
      this.rating, {
        Key key,
      }) : super(key: key);

  @override
  _StarsRowState createState() => _StarsRowState();
}

class _StarsRowState extends State<StarsRow> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [];
    for (int i = 0; i < 3; i++) {
      if (i < widget.rating) {
        stars.add(Icon(
          Icons.star,
          color: Colors.orange,
        ));
      } else {
        stars.add(Icon(
          Icons.star_border,
          color: Colors.white30,
        ));
      }
    }
    return Row(children: stars);
  }
}

class white_box extends StatefulWidget {
  final IconData icon;
  final String text;
  final IconData icon2;
  final String text2;

  const white_box(
      this.icon,
      this.text,
      this.icon2,
      this.text2, {
        Key key,
      }) : super(key: key);
  @override
  _white_boxState createState() => _white_boxState(
    this.icon,
    this.text,
  );
}

class _white_boxState extends State<white_box> {
  var curenticon;
  var curenttext;
  var number1 = 1;

  _white_boxState(this.curenticon, this.curenttext);
  @override
  Widget build(BuildContext context) {
    final List<Widget> box = [];
    return TextButton(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              curenticon,
              color: Colors.black,
            ),
            Expanded(
              child: Text(
                (curenttext),
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        setState(() {
          if (number1 == 0) {
            curenticon = widget.icon;
            curenttext = widget.text;
            number1++;
          } else {
            curenticon = widget.icon2;
            curenttext = widget.text2;
            number1 = 0;
          }
        });
      },
    );
  }
}