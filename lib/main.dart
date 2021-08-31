import 'dart:ffi';
import 'package:calculator/buttonForCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var screen='0', overhead='';

  tappedbutton(var tapp)
  {
    if(screen == '0') screen = '';
    setState(() {
      screen += '$tapp';
    });
  }

  clear(var txt)
  {
    setState(() {
      screen = '0' ;
      overhead = '';
    });
  }

  calculate(var txt)
  {
    Parser p = Parser();
    Expression exp = p.parse(screen);
    ContextModel cm = ContextModel();

    setState(() {
      overhead = screen;
      screen = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
  plusminus(var num)
  {
    double nm = double.parse(screen);
    nm *= -1;
    setState(() {
      screen = nm.toString();
    });
  }
  outOfHundred(var txt)
  {
    double nm = double.parse(screen);
    nm *= 0.01;
    setState(() {
      screen = nm.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          padding: EdgeInsets.all(45),
          child: Column(
            children: <Widget>[
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(overhead, style: TextStyle(fontSize: 24, color: Colors.black87,),),
                ),
                alignment: Alignment(1.0, 1.0),
                ),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(screen, style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 48, color: Colors.white,),),),
                ),
                alignment: Alignment(1.0, 1.0),
                ),

          ],
      ),
      ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded( child:Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonForCalc( text: 'AC',background: Colors.grey,textColor: Colors.black ,func:clear),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '7',func:tappedbutton),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '4',func:tappedbutton),
                    SizedBox(height: 10),
                    ButtonForCalc( text: '1',func:tappedbutton),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '0',func:tappedbutton),
                    SizedBox(height: 10,),
                  ]
              )
              ),

              Expanded( child:Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonForCalc( text: '+/-',background: Colors.grey,textColor: Colors.black ,func:plusminus),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '8',func:tappedbutton),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '5',func:tappedbutton),
                    SizedBox(height: 10),
                    ButtonForCalc( text: '2',func:tappedbutton),
                    SizedBox(height: 73,),
                  ]
              )
              ),

              Expanded( child:Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonForCalc( text: '%',background: Colors.grey,textColor: Colors.black ,func:outOfHundred),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '9',func:tappedbutton),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '6',func:tappedbutton),
                    SizedBox(height: 10),
                    ButtonForCalc( text: '3',func:tappedbutton),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '.',func:tappedbutton),
                    SizedBox(height: 10,),
                  ]
              )
              ),
              Expanded( child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonForCalc( text: '/',background: Colors.orangeAccent,func:tappedbutton),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '*',background: Colors.orangeAccent,func:tappedbutton),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '-',background: Colors.orangeAccent,func:tappedbutton),
                    SizedBox(height: 10),
                    ButtonForCalc( text: '+',background: Colors.orangeAccent,func:tappedbutton),
                    SizedBox(height: 10,),
                    ButtonForCalc( text: '=',background: Colors.orangeAccent,func:calculate),
                    SizedBox(height: 10,),
                  ]
              )
              ),

            ],
          ),
        )
    );
  }
}
