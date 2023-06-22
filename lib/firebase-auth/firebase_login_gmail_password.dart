import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quamtum_it_solutions/main.dart';
import 'package:quamtum_it_solutions/image_picker.dart';
import 'package:quamtum_it_solutions/used_main_view/login_page.dart';

import '../show-messages/show_message.dart';


class FirebaseAuthentication{
  static final  box= Hive.box('Authentication');
  static UserCredential?  auth;
   static SignUpWithGmail(String email, String password,String userName,String profileUrl,String profileRef,BuildContext context)async{
     try {
       auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email, password: password,);
       final ref=FirebaseFirestore.instance.collection('users').doc(userName);
       ref.set({
         'username':userName.toString(),
         'profileUrl':await FirebaseStorage.instance.ref().child(profileRef.toLowerCase()).getDownloadURL(),
         'profileRef':profileRef
       });
       await FirebaseAuth.instance.currentUser!.updateEmail(email);
       await FirebaseAuth.instance.currentUser!.updateDisplayName(userName);
       await FirebaseAuth.instance.currentUser!.updatePassword(password);
       box.put('login',true);
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage2()));
       ShowMessage.displayMessage("Registered Successfully", context,Colors.blue);
     }catch (e){
       if(e.toString().toLowerCase().contains("already")){
         ShowMessage.displayMessage("The email is Already in Use", context,Colors.red);
       }else{
         ShowMessage.displayMessage(e.toString(), context,Colors.red);
       }

     }
  }
   static SignInWithGmail(String email, String password,String userName,BuildContext context)async{
     try {
       auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: email, password: password);
       box.put('login',true);
       await FirebaseAuth.instance.currentUser!.updateEmail(email);
       await FirebaseAuth.instance.currentUser!.updateDisplayName(userName);
       await FirebaseAuth.instance.currentUser!.updatePassword(password);
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage2()));
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
   static Future<void> signInWithGoogle(BuildContext context) async {
     // Trigger the authentication flow
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     // Obtain the auth details from the request
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

     // Create a new credential
     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken,
     );

     box.put('login',true);
     //_userMail= googleUser?.email as String;
     // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseAuth.instance.currentUser!.updateEmail('${googleUser?.email}');
      FirebaseAuth.instance.currentUser!.updateDisplayName('${googleUser?.displayName}');
     final ref=FirebaseFirestore.instance.collection('users').doc('${googleUser?.displayName}');
     ref.set({
       'username':'${googleUser?.displayName}',
       'profileUrl':googleUser!.photoUrl,
       'profileRef':'No reference'
     });
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage2()));

   }
   static void getData(String username)async{
     final data= await FirebaseFirestore.instance.collection('chats').doc(FirebaseAuthentication.
     generateChatId(username)).collection(DateTime.now().toString().substring(0,10))
         .get();
     data.docs.forEach((element) {
       Map data=element.data();
       if(data['username']!=FirebaseAuth.instance.currentUser!.displayName) {
         element.reference.update({'seen': true});
       }
     });

   }
   static String generateChatId(String title){
     List chatId=[];
     String chatRefId='';
     chatId.add(FirebaseAuth.instance.currentUser?.displayName.toString());
     chatId.add(title);
     chatId.sort();
     chatRefId=chatId[0]+' '+chatId[1];
     chatId.clear();
     chatId=chatRefId.split(' ');
     chatRefId='';
     chatId.forEach((element) {
       chatRefId+=element;
     });
     return chatRefId;
   }
  static signOut(BuildContext context)async{
    box.put('login',false);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MyApp()));
    await FirebaseAuth.instance.signOut();
  }
}