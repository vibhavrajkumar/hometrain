import 'package:flutter/material.dart';

class Signin_Builder extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => _signin();
  
  
}

class _signin extends State<Signin_Builder>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Row(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                border: Border.all(
                  color: const Color.fromRGBO(0, 93, 92, 1.0),
                  width: 3
                )
              ),
            )
            )
        ]
      )
    );
  }
}

Widget signup(BuildContext context){
  return Scaffold();
}
