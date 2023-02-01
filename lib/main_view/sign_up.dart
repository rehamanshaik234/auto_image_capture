import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class SignUp extends StatefulWidget {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phoneNumber;
   late bool checkBox;

  SignUp({ required this.name, required this.email, required this.password, required this.phoneNumber,required this.checkBox});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create an\n'
              'Account',style: TextStyle(color: CupertinoColors.destructiveRed,
              fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 16,
          ),
          Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
          TextField(
            controller: widget.name,
            decoration: InputDecoration(
                hintText: 'John deo',
                suffixIcon: Icon(Icons.person,color: Colors.red,)
            ),
          ),
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
          Text("Contact no.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child:  IntlPhoneField(
              controller: widget.phoneNumber,
              decoration: InputDecoration(
                hintText: 'Phone Number',
              ),
              initialCountryCode: 'IN',
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(value: widget.checkBox, onChanged: (bool? value) {
                setState(() {
                  widget.checkBox=!widget.checkBox;
                });
              },activeColor: Colors.red,overlayColor: MaterialStatePropertyAll<Color>(Colors.white),
                side: BorderSide(color: Colors.red,width: 2),
              ),
              Text('I agree with',style: TextStyle(color: Colors.grey,fontSize: 14),),
              SizedBox(
                width: 8,
              ),
              Text('Terms & Conditions',style: TextStyle(color: Colors.red,fontSize: 16,fontWeight:
              FontWeight.w500),)

            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have any account?',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
              SizedBox(
                width: 8,
              ),
              Text(
                'Sign In',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
