import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Simple Calculators'),
    );
  }
}

class MyHomePage extends StatefulWidget {


  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayString = '0';
  String numberString = '0';
  double result = 0;
  String operation;

  Widget createButton (String title){
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          onPressed: () => pressButton(title),
          child: Text(title,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1
          ),
          highlightedBorderColor: Colors.white,
        ),
      ),
    );
  }

  pressButton(String title){
    setState(() {
      if(title == '+' || title ==  '-' ||title == '/' || title =='^'
          ||title == '%' || title =='*'){
        result= double.parse(numberString) ?? 0;
        numberString='';
        operation = title;
        // perbagus ui
        // perbagus button
      }
      else if (title == 'CE'){
        numberString= '';
        displayString='0';
        result=0;
      }else if(title == '='){
      calculate();
      }
      else{
        if (numberString == '0' || numberString == '0.0'){
          numberString='';
        }
        numberString += title;
        displayString = numberString;
      }
    });
  }
  calculate(){
    switch (operation){
      case '+':
        result= result +=double.parse(numberString);
        break;
      case '-':
        result= result -=double.parse(numberString);
        break;
      case '/':
        result= result /=double.parse(numberString);
        break;
      case '*':
        result= result *=double.parse(numberString);
        break;
      case '%':
        result= result %=double.parse(numberString);
        break;
      case '^':
        result= result +=double.parse(numberString);
        break;
      default:
        break;
    }
    numberString= result.toString();
    displayString=numberString;
  }

  Widget createButtonFull(String title1,String title2,String title3,String title4){
    return Expanded(
      child: Row(
        children: <Widget>[
        createButton(title1),
        createButton(title2),
        createButton(title3),
        createButton(title4),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Text(
                        displayString,
                      style: TextStyle(fontSize: 70),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
              children: <Widget>[
                    createButtonFull('%', '/', '*', 'CE'),
                    createButtonFull('7', '8', '9', '+'),
                    createButtonFull('4', '5', '6', '-'),
                    createButtonFull('1', '2', '3', '='),
                    createButtonFull('', '0', '', ''),
              ],
              ),
            ),
        ],
      ),
      ),
    );
  }
}





