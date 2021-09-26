import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
 

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

String output="0";
String _output="0";
double num1=0.0;
double num2=0.0;
String operand="";

operation(String btntext){

  if(btntext=="C"){
 _output="0";
 num1=0.0;
 num2=0.0;
 operand="";
  }
  else if(btntext=="+" || btntext=="-" || btntext=="*" || btntext=="/"){
    num1=double.parse(output);
    operand= btntext;
    _output="0";
  }
  else if(btntext == "="){
    num2=double.parse(output);

    if(operand == "+"){
      _output=(num1 + num2).toString();
    }

    if(operand == "-"){
      _output=(num1 - num2).toString();
    }

    if(operand == "*"){
      _output=(num1 * num2).toString();
    }

    if(operand == "/"){
      _output=(num1 / num2).toString();
    }

    num1=0;
    num2=0;
    operand ="";
  }
  else {
    _output =_output + btntext;
  }

  setState(() {
      output= double.parse(_output).toString();
    });
}

Widget button( String btntext){

return Expanded(
                    child: RawMaterialButton(
                      
                      child: Text("$btntext",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700)),
                      onPressed: (){
                        operation(btntext);
                      },
                      padding: EdgeInsets.all(25),
                      splashColor: Colors.green,
                      fillColor: Colors.black,
                    ),
                    );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator",style: TextStyle(fontSize: 22,color: Colors.black),),
          backgroundColor: Colors.lightGreen,
          ),
          body: 
          Container(
            margin: EdgeInsets.all(0),
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Expanded(
                child: Container(
                alignment: Alignment.bottomRight,
                child: Text("$output",
                style: TextStyle(fontSize: 60,fontWeight: FontWeight.w700,color: Colors.white,),),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(color: Colors.black),
                ) ,
                ),
              Row(
                children: [
                 
                 button('9'),
                 button('8'),
                 button('7'),
                 button('/'),
                ],
              ),
              Row(
                children: [
                 
                 button('6'),
                 button('5'),
                 button('4'),
                 button('*'),
                ],
              ),
              Row(
                children: [
                 
                 button('3'),
                 button('2'),
                 button('1'),
                 button('+'),
                ],
              ),
              Row(
                children: [
                 
                 button('0'),
                 button('-'),
                 button('C'),
                 button('='),
                ],
              ),
            ],),
          ),
          ),
      
    );
  }
}
 