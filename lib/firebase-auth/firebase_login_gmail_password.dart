
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../show-messages/show_message.dart';


class FirebaseAuthentication{
   static UserCredential?  auth;
   static SignUpWithGmail(String email, String password,BuildContext context)async{
     try {
       auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email, password: password);
       await FirebaseAuth.instance.currentUser!.updateEmail(email);
       await FirebaseAuth.instance.currentUser!.updatePassword(password);

       ShowMessage.displayMessage("Registered Successfully", context,Colors.blue);
     }catch (e){
       if(e.toString().toLowerCase().contains("already")){
         ShowMessage.displayMessage("The email is Already in Use", context,Colors.red);
       }else{
         ShowMessage.displayMessage(e.toString(), context,Colors.red);
       }

     }
  }
   static SignInWithGmail(String email, String password,BuildContext context)async{
     try {
       auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: email, password: password);
       ShowMessage.displayMessage("Login Successfully", context,Colors.blue);
     }catch (e){
       if(e.toString().toLowerCase().contains("password")){
         ShowMessage.displayMessage("The password is invalid", context,Colors.red);
       }
       else{
         ShowMessage.displayMessage(e.toString(), context,Colors.red);
       }

     }
   }
   static Future<UserCredential> signInWithGoogle() async {
     // Trigger the authentication flow
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

     // Obtain the auth details from the request
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

     // Create a new credential
     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken,
     );
     //_userMail= googleUser?.email as String;
     // Once signed in, return the UserCredential
     return await FirebaseAuth.instance.signInWithCredential(credential);
   }
  static signOut(BuildContext context)async{
     await FirebaseAuth.instance.signOut();
  }
}