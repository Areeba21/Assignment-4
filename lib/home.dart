import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

 class _HomeState extends State<Home> {
 var result = "";




Widget btn(var text){
  return ElevatedButton(onPressed: (){
    setState(() {
      result = result+text;
    });
  }, child: Text(text));
}
clear(){
  setState(() {
     result="";
  });
  
}


output(){
  Parser p = Parser();
  Expression exp = p.parse(result);
  ContextModel cm =ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  setState(() {
    result = eval.toString();
  });
}


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(result,style:TextStyle(
                  fontSize: 40,fontWeight: FontWeight.bold
      
                ),
                
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.black, // background
    onPrimary: Colors.white, 
                  ), onPressed: clear, child:Text("clear") ),
                  btn("%"),
                  btn("x"),
                  btn("/"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("7"),
                  btn("8"),
                  btn("9"),
                  btn("*")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("4"),
                  btn("5"),
                  btn("6"),
                  btn("-")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("1"),
                  btn("2"),
                  btn("3"),
                  btn("+")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("0"),
                  btn("00"),
                  btn("."),
                 ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.black, // background
    onPrimary: Colors.white, 
                  ),onPressed: output, child: Text("="))
                  
                ],
              ),
            ]
          ),
        ), 
      );
  
  }
}








