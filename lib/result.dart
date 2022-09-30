import 'package:bmicalculator/ReusableCard.dart';
import 'package:bmicalculator/constantfile.dart';
import 'package:bmicalculator/result.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi,required this.bodysize,required this.interpret});
  final String bmi;
  final String bodysize;
  final String interpret;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor:  Color(0XFF0A0E21),
      appBarTheme: AppBarTheme(color: Color(0XFF0A0E21),),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text('BMI CALCULATOR'),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text('YOUR RESULT',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kactivecolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(bodysize, style:TextStyle(fontSize:22.0, color:Color(0xFF24D876),fontWeight: FontWeight.bold)),
                    Text(bmi,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 100.0)),
                    Text(interpret,style:TextStyle(fontSize: 22.0,),textAlign: TextAlign.center,)
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('RE-CALCULATE',style: klargelabelstyle,),
               color:  Color(0XFFEB1555),
                height:80.0,
              ),
            )
          ],
        )
      ),
    );
  }
}
