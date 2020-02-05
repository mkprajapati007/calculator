import 'package:flutter/material.dart';
//import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationfontsize = 30;
  double resultfontsize = 40;

  calculate() {
    expression = equation;

    try {
      Parser p = new Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      result = '${exp.evaluate(EvaluationType.REAL, cm)}';
    } catch (e) {
      //result = "Error :";
    }
  }

  buttontext(String btntext) {
    setState(() {
      if (btntext == "AC") {
        equation = "0";
        result = "0";
      } else if (btntext == "<-") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
          result = "0";
        }

        calculate();
      } else if (btntext == "=") {
        equationfontsize = 30;
        resultfontsize = 40;

        calculate();
      } else {
        if (equation == "0") {
          equation = btntext;
        } else
          equation = equation + btntext;
      }
    });
  }

  Widget btn(String txt, {bgColor: Colors.grey}) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        child: Text(
          txt,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.all(15),
        onPressed: () => buttontext(txt),
        color: bgColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(125.0),
            side: BorderSide(color: Colors.black)),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      //backgroundColor: Colors.blue,
      appBar: AppBar(
          title: Text(
        'Calculator',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )),
      body: Container(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: SizedBox(
                height: 50,
              )),
              Container(
                  child: Expanded(
                      child: Text(
                equation,
                style: TextStyle(
                    fontSize: equationfontsize, fontWeight: FontWeight.bold),
              ))),
              Container(
                  child: Expanded(
                      child: Text(
                result,
                style: TextStyle(
                    fontSize: resultfontsize, fontWeight: FontWeight.bold),
              ))),
              Container(
                  color: Colors.black26,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //Expanded(child: Divider(height: 50)),
                        Container(
                            child: Row(
                          children: <Widget>[
                            btn("AC", bgColor: Colors.orangeAccent),
                            btn("<-", bgColor: Colors.orangeAccent),
                            btn("%", bgColor: Colors.orangeAccent),
                            btn("/", bgColor: Colors.orangeAccent)
                          ],
                        )),
                        Row(
                          children: <Widget>[
                            btn("7"),
                            btn("8"),
                            btn("9"),
                            btn("*", bgColor: Colors.orangeAccent)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            btn("4"),
                            btn("5"),
                            btn("6"),
                            btn("-", bgColor: Colors.orangeAccent)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            btn("1"),
                            btn("2"),
                            btn("3"),
                            btn("+", bgColor: Colors.orangeAccent)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            btn("0"),
                            btn("00"),
                            btn("."),
                            btn("=", bgColor: Colors.orangeAccent)
                          ],
                        ),
                        Container(
                            child: Text('Created By:- Mahesh Kr. Prajapati',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white)))
                      ],
                    ),
                  )),
            ]),
      )),
    );
  }
}
