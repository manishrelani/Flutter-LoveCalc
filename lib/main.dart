import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(Love());

class Love extends StatefulWidget {
  @override
  _LoveState createState() => _LoveState();
}

class _LoveState extends State<Love> {
  String txt = "GO";
  Random ran = new Random();
  int num1;
  double num2;
  int flag = 0;
  int i = 0;
  final fname = TextEditingController();
  final pname = TextEditingController();
  Color col=Colors.transparent;

  var array = [
    "",
    "I never want to stop making memories with you.",
    "All that you are is all that I’ll ever need.",
    "I want all of you, forever, you and me, every day."
  ];

  press() {
    if (fname.text.isEmpty || pname.text.isEmpty  || flag == 1 ) return;
    if (fname.text.contains(RegExp(r'[\d]')) ||
        pname.text.contains(RegExp(r'[\d]')))
      return;
    else {
      setState(() {
        col=Colors.white;
        i = ran.nextInt(3)+1;
        num1 = ran.nextInt(29) + 70;
        num2 = ran.nextDouble();
        txt = (num1 + num2).toStringAsFixed(2);
        flag = 1;
      });
    }
  }

  clear() {
    setState(() {
      col=Colors.transparent;
      txt = "GO";
      fname.text="";
      pname.text="";
      flag = 0;
      i = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: 0.50,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/love_image2.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /* Text(
                  "Your Name",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ), */
                Container(
                  margin: EdgeInsets.all(25),
                  child: TextField(
                    controller: fname,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Your Name",
                      fillColor: Colors.cyan[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  child: FlatButton(
                    textColor: Colors.white,
                    onPressed: press,
                    child: Image.network(
                        "http://pngimg.com/uploads/heart/heart_PNG51258.png"),
                  ),
                ),
                /*  Text(
                  "Your Partner's name",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ), */
                Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: TextField(
                    controller: pname,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Your Partner name",
                      fillColor: Colors.cyan[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 151,
                  margin: EdgeInsets.all(25),
                  alignment: Alignment.center,
                  child: Text(
                    array[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                MaterialButton(
                  //  color: Colors.cyan[50],
                  onPressed: clear,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "Clear",
                    style: TextStyle(color: col, fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 228),
              child: Text(
                txt,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
