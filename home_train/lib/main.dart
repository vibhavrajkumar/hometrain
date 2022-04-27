import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:home_train/components/login_in.dart';
import 'components/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';
import 'components/signin_widgets.dart';

List<CameraDescription> cameras = [];

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }

  WidgetsFlutterBinding.ensureInitialized();

// initializing the firebase app
  // await Firebase.initializeApp();

// calling of runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Train',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get dimensions to set sizes relative to size of screen
    double width = MediaQuery.of(context).size.width;
    double height =
        MediaQuery.of(context).size.height; //safearea (valid button locations)
    var padding = MediaQuery.of(context).padding;
    double total_height = height -
        padding.top -
        padding.bottom; //total height (including unsafe area)
    return Scaffold(
        //create widgets in a uniform line
        body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                alignment: const FractionalOffset(0.2, 0.3),
                child: Image.asset(
                  "images/HomeTrainLogo.png",
                  width: width * 0.8,
                ), //logo upload
              ),
              //create button for login page
              Positioned(
                bottom: 150,
                right: 25,
                child: TextButton(
                  onPressed: () {
                    //send to SignInBuilder page when button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninBuilder(),
                          fullscreenDialog: true),
                    );
                  },
                  child: Container(
                      //create box with "log in" with correct colors
                      height: 50,
                      width: 250,
                      color: Colors.transparent,
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(0, 93, 92, 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: const Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat'),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                ),
              ),
              //create box with "sign up and correct colors"
              Positioned(
                  bottom: 50,
                  right: 25,
                  child: TextButton(
                      //when button is pressed, send to sign up page
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpBuilder()),
                        );
                      },
                      child: Container(
                          height: 50,
                          width: 250,
                          color: Colors.transparent,
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(0, 66, 96, 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: const Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'Montserrat'),
                                  textAlign: TextAlign.center,
                                ),
                              ))))),
            ],
          ),
        ]));
  }
}
