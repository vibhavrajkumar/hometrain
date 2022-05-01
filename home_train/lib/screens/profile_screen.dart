import 'package:flutter/material.dart';
import 'package:home_train/components/generic_banner.dart';
import 'package:home_train/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



/*
  Screen for displaying the user's Profile.

  @params:
  TODO: ADD PROFILE FEATURES
*/
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

/*
  Current "Dummy State" for pulling up a Profile page
*/
class _ProfileScreen extends State<ProfileScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  get child => null; 
  getProfileImage(){
    if(_firebaseAuth.currentUser?.photoURL != null){

      return Image.network(_firebaseAuth.currentUser!.photoURL!, height: 50,width: 50);
    }
    else{
      return const Icon(Icons.account_circle, size: 50); 
    }
  }

  Future<void> signout() async{
      return await _firebaseAuth.signOut(); 
  }

  @override
  Widget build(BuildContext context) {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance; 

    return Scaffold(
        body: Column(children:  [
       GenericBanner(
        homeTrainGreen,
        text: "Let's Profile, \n" + _firebaseAuth.currentUser!.displayName! + " !",

      ),
      getProfileImage(), 

      TextButton(onPressed: () {
        signout(); 
        final googleSignIn = GoogleSignIn(); 
        googleSignIn.disconnect(); 
        Navigator.pop(context);
        Navigator.pop(context); 
      }, 
      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(homeTrainBlue), 
      ),
      child: const Text(
        "Sign Out",
        style:  TextStyle(
            color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 20,
        ),
        textAlign: TextAlign.center,
        )
        )
      //TextButton(onPressed: () {Navigator.pop(context);}, child: Container()),
    ]));

    //TODO: Add Profile Display/Info
  }
}
