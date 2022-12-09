import 'package:flutter/material.dart';

class Greetings extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _Greetings();
}
class _Greetings extends State<Greetings> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),

                child: Text('Welcome!',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff213b5b),
                        fontWeight: FontWeight.w600),

                )),

            Padding(
                padding: EdgeInsets.all(25),

                child: Text('My Tools Buddy',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600),

                )),



            Container(
                padding: EdgeInsets.all(10),
                child:  Image(image: ExactAssetImage("images/icon.png")
                ),
              width: 300,
              height: 300,
            ),


          ],
        ),
      ],
    );
  }
}