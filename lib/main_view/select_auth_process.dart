import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quamtum_it_solutions/firebase-auth/firebase_login_gmail_password.dart';

import 'package:quamtum_it_solutions/main_view/sign_up.dart';
import 'package:quamtum_it_solutions/show-messages/show_message.dart';

import 'login_page.dart';
class SelectLoginType extends StatefulWidget {
  const SelectLoginType({Key? key}) : super(key: key);

  @override
  State<SelectLoginType> createState() => _SelectLoginTypeState();
}

class _SelectLoginTypeState extends State<SelectLoginType> {
  int customSlider=1;
  //signUp
  TextEditingController name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController phoneNumber= TextEditingController();
  TextEditingController password= TextEditingController();
  bool checkBox=false;
  //login
  TextEditingController loginPassword= TextEditingController();
  TextEditingController loginEmail= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Social X',style: TextStyle(color: Colors.white,fontSize: 18),),
        backgroundColor:  CupertinoColors.destructiveRed,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                child: Align(
                  alignment: Alignment.center,
                  child: CustomSlidingSegmentedControl<int>(
                    fixedWidth: MediaQuery.of(context).size.width*0.49,
                    initialValue: customSlider,
                    height: 45,
                    children: {
                      1: Text('Login',style: TextStyle(fontSize: 20,color: customSlider==1?Colors.white:Colors.black),),
                      2: Text('Sign UP',style: TextStyle(fontSize: 20,color: customSlider!=1?Colors.white:Colors.black),),
                    },
                    padding: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    ),
                    thumbDecoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        ),
                      ],
                    ),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInToLinear,
                    onValueChanged: (v) {
                      setState(() {
                        customSlider=v;
                      });
                    },
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: customSlider==1?Login(email: loginEmail,password: loginPassword,):SignUp(name:name,email: email,
                  phoneNumber: phoneNumber,password: password, checkBox: checkBox),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:customSlider==1? SizedBox(
        height: 50,
        child: ClipRRect(

          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
            ),
            onPressed: (){
              if(loginEmail.text.isEmpty){
                ShowMessage.displayMessage('Enter Email', context,Colors.red);
              }
              else if(!loginEmail.text.endsWith('@gmail.com')){
                ShowMessage.displayMessage('Invalid email', context,Colors.red);
              }else if(loginPassword.text.isEmpty){
                ShowMessage.displayMessage('Enter Password', context,Colors.red);
              }else if(loginEmail.text.isNotEmpty&&loginPassword.text.isNotEmpty){
               // FirebaseAuthentication.SignInWithGmail(loginEmail.text, loginPassword.text, context);
              }

            }, child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20),),

          ),
        ),
      ):SizedBox(
        height: 50,
        child: ClipRRect(

          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
            ),
            onPressed: (){
              if(name.text.isEmpty){
                ShowMessage.displayMessage('Enter Name', context,Colors.red);
              }
              else if(email.text.isEmpty){
                ShowMessage.displayMessage('Enter Email', context,Colors.red);
              }
              else if(!email.text.endsWith('@gmail.com')){
                ShowMessage.displayMessage('Invalid email', context,Colors.red);
              }
              else if(phoneNumber.text.isEmpty){
                ShowMessage.displayMessage('Enter Phone Number', context,Colors.red);
              }
              else if(password.text.isEmpty){
                ShowMessage.displayMessage('Enter Password', context,Colors.red);
              }
              else if(name.text.isNotEmpty&&phoneNumber.text.isNotEmpty&&email.text.isNotEmpty&&password.text.isNotEmpty){
               //FirebaseAuthentication.SignUpWithGmail(email.text, password.text, context);
              }
            }, child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 20),),

          ),
        ),
      )
    );
  }
}
