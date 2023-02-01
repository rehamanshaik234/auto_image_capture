import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quamtum_it_solutions/firebase-auth/firebase_login_gmail_password.dart';
class Login extends StatefulWidget {
  late TextEditingController email;
  late TextEditingController password;
  Login({required this.email, required this.password});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SignIn into your\n'
              'Account',style: TextStyle(color: CupertinoColors.destructiveRed,
              fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 16,
          ),
          Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
          TextField(
            controller: widget.email,
            decoration: InputDecoration(
              hintText: 'johndeo@gmail.com',
              suffixIcon: Icon(Icons.email,color: Colors.red,)
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text("Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
          TextField(
            controller: widget.password,
            decoration: InputDecoration(
                hintText: 'password',
                suffixIcon: Icon(Icons.lock_open_outlined,color: Colors.red,)
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Forgot Password?',style: TextStyle(color: CupertinoColors.destructiveRed,
                  fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login with",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.center,),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async{
                  UserCredential user= await FirebaseAuthentication.signInWithGoogle();
                  setState(() {

                  });
                },
                child: SizedBox(
                  height: 60,
                  child: Image.asset('assets/google-logo-image.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(
                width: 32,
              ),
              InkWell(
                onTap: (){},
                child: SizedBox(
                  height: 55,
                  child: Image.asset('assets/fb-logo.jpg',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have any account?',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
              SizedBox(
                width: 8,
              ),
              Text(
                'Register Now',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
