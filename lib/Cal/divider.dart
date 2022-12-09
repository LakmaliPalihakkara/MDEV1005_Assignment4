import 'package:flutter/material.dart';


class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 6,
      decoration: BoxDecoration(gradient:LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Colors.blue,
          Color(0xff7dd1f5),
          Color(0xffadddf3)


        ],
      ) ),
    );
  }
}




// Main Colors (Primary and Secondary)


