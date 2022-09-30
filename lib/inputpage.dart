import 'package:bmicalculator/calculateBMI.dart';
import 'package:bmicalculator/inputpage.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'ReusableCard.dart';
import 'constantfile.dart';
import 'result.dart';
enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender=Gender.female;
  Color maleCardColor=kinactivecolor;
  Color femaleCardColor=kinactivecolor;
  int height=180;
  int weight=60;
  int age=24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR",
          style: TextStyle(
            fontWeight: FontWeight.bold,),),
        centerTitle:true,
      ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(

                    child: ReusableCard(

                      colour: selectedgender ==Gender.male ? kactivecolor:kinactivecolor,
                      cardChild: iconContent(icon: FontAwesomeIcons.mars,label: "MALE",),
                        onPress:(){
                          setState(() {
                            selectedgender=Gender.male;
                          });
                        }
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: selectedgender==Gender.female?kactivecolor:kinactivecolor,
                        cardChild: iconContent(icon:FontAwesomeIcons.venus,label: "FEMALE"),
                        onPress:(){
                          setState(() {
                            selectedgender=Gender.female;
                          });
                        }
                        ),
                  )
                ],
              ),
            ),
            Expanded(
              child:ReusableCard(
                colour: Color(0XFF1D1E33),
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: klabelstyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                    Text(height.toString(),
                    style: knumberstyle,),
                    Text('cm',style: klabelstyle ,),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0XFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),

                        ),
                        child: Slider(value: height.toDouble(),
                            min: 120.0,
                            max:220.0,
                            onChanged:(double newValue)
                        {
                            setState(() {
                              height=newValue.round();
                            });
                        }),
                      )
                  ],)
                ],
              ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(colour: Color(0XFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',
                        style: klabelstyle,),
                        Text(weight.toString(),style: knumberstyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon:FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                            ),
                          ],
                        )
                      ],
                    ),),
                  ),
                  Expanded(
                    child: ReusableCard(colour: Color(0XFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: klabelstyle,),
                        Text(age.toString(),style: knumberstyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }
                            ),
                            SizedBox(
                              width:10
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                     setState(() {
                                       age++;
                                     });
                                })
                          ],
                        )
                      ],
                    ),),
                  ),

                ],
              ),
            ),

              GestureDetector(
                onTap: (){
                  Calculation calc= Calculation(weight: weight,height: height);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>ResultPage(
                        bmi:calc.calculate(),
                        bodysize: calc.getResult(),
                        interpret: calc.getInterpretation())));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('CALCULATE',style:klargelabelstyle),
                  color: Color(0XFFEB1555),
                  width:double.infinity,
                  height:80.0,
                  margin: EdgeInsets.only(top: 10.0),
                ),
              ),

          ],
        ),
        );
  }
}


class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function() onPressed;
  RoundIconButton({required this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        shape:CircleBorder(),
        fillColor: Color(0XFFEB1555),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width:56.0,
          height: 56.0,
        ),

    );
  }
}
