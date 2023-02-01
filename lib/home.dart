import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase-auth/firebase_login_gmail_password.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String name='';

  @override
  void initState() {
    setState(() {

    });

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$name'),
                ElevatedButton(onPressed: (){
                  FirebaseAuthentication.signOut(context);
                }, child: Text('SignOut'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
