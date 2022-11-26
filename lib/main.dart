import 'package:flutter/material.dart';
import 'package:new_calculator/constants.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  var userInput = "";
  var userAnswer = "";
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
            child:
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),

                child: Column(
                  children: [
                    Expanded(child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(40)),
                        Text(userInput.toString(),style: TextStyle(color: Colors.white,fontSize: 30),),
                        Text(userAnswer.toString(),style: TextStyle(color: Colors.white,fontSize: 30),)

                      ],
                    )),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            children: [

                              MyButton(title: "AC",onpress:(){
                                setState((){

                                });
                                userAnswer="";
                                userInput='';

                              } ,),
                              MyButton(title: "+/-",onpress: (){
                                userInput+='+/-';
                                setState(() {

                                });

                              },),
                              MyButton(title: "%",onpress: (){
                                userInput+='%';setState((){

                                });
                              },),
                              MyButton(title: "/",color: Colors.orange,onpress: (){
                                userInput+='/';setState((){

                                });
                              },),


                            ],
                          ),
                          Row(
                            children: [
                              MyButton(title: "7",onpress:(){
                                setState((){

                                });
                                userInput+='7';
                              } ,),
                              MyButton(title: "8",onpress: (){ userInput+='8';setState((){

                              });},),
                              MyButton(title: "0",onpress: (){ userInput+='0';setState((){

                              });},),
                              MyButton(title: "X",color: Colors.orange,onpress: (){
                                userInput+='*';setState((){

                                });
                              },),


                            ],
                          ),
                          Row(
                            children: [
                              MyButton(title: "4",onpress:(){ userInput+='4';setState((){

                              });} ,),
                              MyButton(title: "5",onpress: (){ userInput+='5';setState((){

                              });},),
                              MyButton(title: "6",onpress: (){ userInput+='6';setState((){

                              });},),
                              MyButton(title: "-",color: Colors.orange,onpress: (){
                                userInput+='-';setState((){

                                });
                              },),


                            ],
                          ),
                          Row(
                            children: [
                              MyButton(title: "1",onpress:(){ userInput+='1';setState((){

                              });} ,),
                              MyButton(title: "2",onpress: (){ userInput+='2';setState((){

                              });},),
                              MyButton(title: "3",onpress: (){ userInput+='3';setState((){

                              });},),
                              MyButton(title: "+",color: Colors.orange,onpress: (){
                                userInput+='+';setState((){

                                });
                              },),


                            ],
                          ),
                          Row(
                            children: [
                              MyButton(title: "0",onpress:(){
                                userInput+='0';setState((){

                                });
                              } ,),
                              MyButton(title: ".",onpress: (){
                                userInput+='.';setState((){

                                });
                              },),
                              MyButton(title: "DEL",onpress: (){
                                userInput=userInput.substring(0,userInput.length-1);
                                setState(() {

                                });

                              },),
                              MyButton(title: "=",color: Colors.orange,onpress: (){
                                equlPress();
                                setState(() {

                                });
                              },),


                            ],
                          ),

                          SizedBox(height: 10,)
                        ],
                      ),
                    ),
                  ],
                )
            )
        ),
      ),
    );
  }
  void equlPress(){
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    userAnswer = eval.toString();
  }
}
 class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
   const MyButton({Key? key, required this.title,this.color=Colors.grey,required this.onpress}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Expanded(child: Padding(
       padding: EdgeInsets.symmetric(vertical: 10),
       child: InkWell(
         onTap: onpress,
         child: Container(
           child: Center(child:Text(title,style: TextStyle(color: Colors.white,fontSize: 20),)),
           height: 80,
           width: 50,
           decoration: BoxDecoration(
             color: color,
             shape: BoxShape.circle,
           ),
         ),
       ),
     ));

   }
 }
