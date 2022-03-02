import 'package:flutter/material.dart';

class Signin_Builder extends StatefulWidget{
 const Signin_Builder({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _signin();
}

class _signin extends State<Signin_Builder>{
  @override
   
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: <Widget>[
          const Text("Hello"),
          Align(
              alignment: FractionalOffset.topCenter,
              child: Image.asset(
                "assets/logo.png",width: width*0.3,
                ), //logo upload
              ),
          Align(
            alignment: FractionalOffset.topLeft,
            child: TextButton(onPressed: (){Navigator.pop(context);},
              child: Container(
                height: 50,
                width: 50,
                color: Colors.transparent,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 93, 92,1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: const Center(
                    child: Text("Back",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,),
                  )
                )
              )
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
