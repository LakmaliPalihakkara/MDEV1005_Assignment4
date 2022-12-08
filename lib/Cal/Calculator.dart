import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'CalButton.dart';
 import '../../Cal/Divider.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _Home();
}

class _Home extends State<Calculator> {
  var numbers = ''; // Get enter numbers
  var result = ''; // Get result
  final List<String> button = [
    'C',
    '(',
    ')',
    'x',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '*',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Column(
          children: [
            Expanded(

              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      numbers, // Set numbers to text
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Color(0xff2E3A48),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      result, // Set result to text
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Color(0xff2E3A48),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

           const Line(), //Set divider
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: button.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return CalButton(
                        btnText: button[index],
                        buttonTapped: () {
                          setState(() {
                            numbers = '';
                            result = '';
                          });
                        },
                        color: Color(0xff2E3A48));
                  }else if (index == button.length - 2) {
                    return CalButton(
                        btnText: button[index],
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        color: Color(0xff171C22));
                  }
                  else if (index == 3) {
                    return CalButton(
                        btnText: button[index],
                        buttonTapped: () {
                          setState(() {
                            numbers = numbers.substring(
                                0, numbers.length - 1);//Get one number at a time
                          });
                        },
                        color: Color(0xff2E3A48));
                  }  else if (index == 1 || index == 2) {
                    return CalButton(
                        btnText: button[index],
                        buttonTapped: () {
                          setState(() {
                            numbers += button[index];
                          });
                        },
                        color: Color(0xff2E3A48));
                  } else {
                    return CalButton(
                      btnText: button[index],
                      buttonTapped: () {
                        setState(() {
                          numbers += button[index]; //Entered numbers store in numbers varible
                        });
                      },
                      color: isOperator(button[index]) // If buttons are operators, set blue background. If not set black background to numbers
                          ? Color(0xff3bacdc)
                          : Color(0xff171C22),
                    );
                  }
                },
              ),
            ),
           ],
        ),
      ),
    );
  }

  // Return the result according to operator
  bool isOperator(String x) {
    if (x == '-' || x == '+' || x == '*' || x == '/') {
      return true;
    } else {
      return false;
    }
  }

  // Get the final result after the calculation
  void equalPressed() {
    String finalNumbers = numbers;
    try{
      Parser p = Parser();
      Expression exp = p.parse(finalNumbers);
      ContextModel contextModel = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, contextModel);
      result = eval.toString();
    }catch(e){
      print(e);
    }


  }
}
