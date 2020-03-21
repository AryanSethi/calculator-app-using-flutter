import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: MyHomePage(title: 'Simple calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output="0";
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand= "";

  buttonPressed(String buttonText){
    if(buttonText=="Clear"){
      _output="0";
      num1=0.0;
      num2=0.0;
      operand= "";
    }

    else if(buttonText=="+" || buttonText=="-" || buttonText=="x" || buttonText=="/"){
      num1= double.parse(output);
      operand= buttonText;
      _output= operand;
    }

    else if(buttonText=='.'){
      if(_output.contains(".")){
        print("Already contains a decimal !");
        return;
      }
      else{
        _output=_output+buttonText;
      }
    }

    else if(buttonText=="="){
      num2= double.parse(output);

      if(operand== "+"){
        _output= (num1+num2).toString();
      }
      if(operand== "-"){
        _output= (num1-num2).toString();
      }
      if(operand== "/"){
        _output= (num1/num2).toString();
      }
      if(operand== "x"){
        _output= (num1*num2).toString();
      }
      num1=0;
      num2=0;
      operand = "";
    }

    else{
      _output=_output + buttonText;
    }

    print(_output);
    setState((){
      output=_output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: RaisedButton(
        child: Text(buttonText,
            style: TextStyle(color: Colors.black, fontSize: 19.0)),
        padding: EdgeInsets.all(22.0),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: () => buttonPressed(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                  child: Text(output,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold))),
              Expanded(
                child: Divider(color: Colors.white),
              ),
              Column(children: <Widget>[
                Row(children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("x"),
                ]),
                Row(children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-"),
                ]),
                Row(children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("+"),
                ]),
                Row(children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("/"),
                ]),
                Row(children: <Widget>[
                  buildButton("Clear"),
                  buildButton("="),
                ]),
              ]),
            ],
          ),
        ));
  }
}
