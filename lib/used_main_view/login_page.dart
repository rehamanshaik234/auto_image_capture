import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:quamtum_it_solutions/firebase-auth/firebase_login_gmail_password.dart';
import 'package:quamtum_it_solutions/used_main_view/sign_up.dart';

import '../show-messages/show_message.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
   TextEditingController userName=TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 120,
                    child: Image.asset('assets/medicine.jpeg',fit: BoxFit.cover,),),
                ],
              ),
              Text('Sign In ',style: TextStyle(color: CupertinoColors.black,
                  fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('@',style: TextStyle(
                    color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'johndeo@gmail.com',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person,color: Colors.blue,),

                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextField(
                      controller: userName,
                      decoration: InputDecoration(
                        hintText: 'username',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.lock_open_outlined,color: Colors.red,),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: PasswordField(
                        color: Colors.blue,
                        passwordConstraint: r'.*[@$#.*].*',
                        inputDecoration: PasswordDecoration(
                            hintStyle: TextStyle(color: Colors.grey)
                        ),
                        hintText: 'Password',
                        controller: password,
                        errorMessage:
                        'must contain special character either . * @ # \$',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?',style: TextStyle(color: CupertinoColors.activeBlue,
                      fontSize: 14,fontWeight: FontWeight.w400),textAlign: TextAlign.right,),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(onPressed: (){
                        if(email.text.isEmpty){
                          ShowMessage.displayMessage('Enter Email', context,Colors.red);
                        }
                        else if(!email.text.endsWith('@gmail.com')){
                          ShowMessage.displayMessage('Invalid email', context,Colors.red);
                        }else if(password.text.isEmpty){
                          ShowMessage.displayMessage('Enter Password', context,Colors.red);
                        }else if(email.text.isNotEmpty&&password.text.isNotEmpty){
                          FirebaseAuthentication.SignInWithGmail(email.text, password.text,userName.text,context);
                        }
                      },child: Text('Sign In',style: TextStyle(
                        color: Colors.white,fontSize: 20
                      ),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("–––––––––– OR ––––––––––",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async{
                      await FirebaseAuthentication.signInWithGoogle(context);
                      setState(() {

                      });
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/google-logo-image.png',fit: BoxFit.cover,height: 40,),
                              Text('Continue with Google',style: TextStyle(fontWeight: FontWeight.w400),)
                            ],
                          ),
                        )
                      ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New to Adhicine?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SignUp()));
                    },
                    child: Text(
                      'Sign Up',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
