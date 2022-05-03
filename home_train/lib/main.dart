import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';
import 'components/signin_widgets.dart';
import 'package:home_train/firebase_options.dart';

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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      //home: const BottomNavbar(),
      // home: const LoginPage(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SigninBuilder(); 
  }
}

// Positioned(
//                 bottom: 150,
//                 right: 25,
//                 child: TextButton(
//                   onPressed: () {
//                     //send to SignInBuilder page when button is pressed
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const SigninBuilder(),
//                           fullscreenDialog: true),
//                     );
//                   },
//                   child: Container(
//                       //create box with "log in" with correct colors
//                       height: 50,
//                       width: 250,
//                       color: Colors.transparent,
//                       child: Container(
//                           decoration: const BoxDecoration(
//                               color: Color.fromRGBO(0, 93, 92, 1.0),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20.0))),
//                           child: const Center(
//                             child: Text(
//                               "Log In",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                   fontFamily: 'Montserrat'),
//                               textAlign: TextAlign.center,
//                             ),
//                           ))),
//                 ),
//               ),