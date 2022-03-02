import 'package:flutter/material.dart';

class Signin_Builder extends StatefulWidget {
  //new widget for signin page
  const Signin_Builder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _signin();
}

class _signin extends State<Signin_Builder> {
  //actual build of the signin page
  bool value = false; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create an app bar (bar on the top portion of the screen)
        appBar: AppBar(
          shape: const ContinuousRectangleBorder(
            //give the bar rounded edges on the bottom to make it cleaner
            borderRadius:BorderRadius.only(
              bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
          backgroundColor: const Color.fromRGBO(0, 93, 92, 1.0), 
          leading: Builder(
            builder: (BuildContext context) {
              //create back button, when pressed will return to previous screen
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: const Text('Sign In',
            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
        ),
        body: Column(
          //create text fields and login button 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //textfield for username 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
            Padding(
              //textfield for password
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
            ),
            Padding(
              //create "Remember Me" checkbox 
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(children: <Widget>[ 
              // create in a uniform row 
              //text for checkbox
              const Text('Remember Me', style:TextStyle(
                color: Color.fromRGBO(0,93,92,1.0),
                fontSize: 15,
                fontFamily: 'Montserrat'
              ),),
              //textbox with theme fill color
              Checkbox(value: this.value, onChanged: (bool? value){
                setState(() {
                  this.value = value!; 
                });
              },checkColor: Colors.white,activeColor: const Color.fromRGBO(0, 93, 92, 1.0))
            ]),
            ),
            TextButton(
              //todo (link with firebase when "login" pressed)
              onPressed: () {},
              child: Container(
                //create login button with correct colors and rounded edges
                  height: 50,
                  width: 100,
                  color: Colors.transparent,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 93, 92, 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Montserrat'),
                          textAlign: TextAlign.center,
                        ),
                      ))),
            ),
          ],
        ));
  }
}


class SignUp_Builder extends StatefulWidget {
  //widget for the signup page
  const SignUp_Builder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _signup();
}

class _signup extends State<SignUp_Builder> {
  //build of the signup page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create top bar of the signup page with rounded bottom borders
        appBar: AppBar(
          shape: const ContinuousRectangleBorder(
            borderRadius:BorderRadius.only(
              bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
          backgroundColor: const Color.fromRGBO(0, 93, 92, 1.0),
          leading: Builder(
            builder: (BuildContext context) {
              //go back to previous screen when back button pressed
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: const Text('Sign Up',style: TextStyle(
            color: Colors.white, fontFamily: 'Montserrat')),
        ),
        body: Column(
          //create text fields and signup button align in a column 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //create username creation textfield 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            //create password creation textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            //create confirm password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            //create signup button with rounded edges
            TextButton(
              onPressed: () {},
              child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.transparent,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 93, 92, 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Montserrat'),
                          textAlign: TextAlign.center,
                        ),
                      ))),
            ),
          ],
        ));
  }
}
