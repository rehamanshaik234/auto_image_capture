import 'package:flutter/material.dart';
import 'package:quamtum_it_solutions/firebase-auth/firebase_login_gmail_password.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back_ios,color: Colors.black,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.jpg'),
                        radius: 35,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Take Care!',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          SizedBox(height: 8,),
                          Text('Richa Bose',style:
                          TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Settings',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.notifications_none_outlined,color: Colors.grey,size: 30,),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Notification',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(height: 2,),
                            Text('Check your Medicine Notification',style:
                            TextStyle(fontSize:14,fontWeight: FontWeight.w300),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.volume_up_sharp,color: Colors.grey,size: 30,),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sound',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(height: 2,),
                            Text('Ring, Silent, Vibrate',style:
                            TextStyle(fontSize:14,fontWeight: FontWeight.w300),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.person_3_outlined,color: Colors.grey,size: 30,),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Manage your Account',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(height: 2,),
                            Text('Password, Email id, Phone Number',style:
                            TextStyle(fontSize:14,fontWeight: FontWeight.w300),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.notifications_none_outlined,color: Colors.grey,size: 30,),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Notification',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(height: 2,),
                            Text('Check your Medicine Notification',style:
                            TextStyle(fontSize:14,fontWeight: FontWeight.w300),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.notifications_none_outlined,color: Colors.grey,size: 30,),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Notification',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                            SizedBox(height: 2,),
                            Text('Check your Medicine Notification',style:
                            TextStyle(fontSize:14,fontWeight: FontWeight.w300),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Device',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.lightBlueAccent.shade200,
                    borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.lightBlueAccent.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16.0,left: 16,right: 16),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(Icons.volume_up_sharp,color: Colors.grey,size: 30,),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Connect',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                      SizedBox(height: 2,),
                                      Text('Bluetooth, Wi-Fi',style:
                                      TextStyle(fontSize:14,fontWeight: FontWeight.w300),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(Icons.volume_up_sharp,color: Colors.grey,size: 30,),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Sound Option',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                      SizedBox(height: 2,),
                                      Text('Ring, Vibrate, Silent',style:
                                      TextStyle(fontSize:14,fontWeight: FontWeight.w300),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Caretakers: 03',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.lightBlueAccent.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.lightBlueAccent.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16.0,left: 0,right: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage('assets/logo.jpg'),
                                        radius: 33,
                                      ),
                                      SizedBox(height: 8,),
                                      Text('Dipa Luna')
                                    ],
                                  ), Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage('assets/logo.jpg'),
                                        radius: 33,
                                      ),
                                      SizedBox(height: 8,),
                                      Text('Roz Sod..')
                                    ],
                                  ), Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage('assets/logo.jpg'),
                                        radius: 33,
                                      ),
                                      SizedBox(height: 8,),
                                      Text('Sunny Luna')
                                    ],
                                  ), Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        child: Icon(Icons.add,color: Colors.white,size: 30,),
                                        radius: 33,
                                      ),
                                      SizedBox(height: 8,),
                                      Text('Add')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Doctor',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0,left: 0,right: 0,bottom: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            child: Icon(Icons.add,color: Colors.white,size: 30,),
                            radius: 33,
                          ),
                          SizedBox(height: 8,),
                          Text('Add Your Doctor',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Or use',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)),
                              SizedBox(width: 8,),
                              Text('Invite Link',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.orange)),
                            ],
                          )
                        ]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text('Privacy Policy',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text('Terms of Use',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text('Rate Us',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text('Share',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                ),
                InkWell(
                  onTap: (){
                    FirebaseAuthentication.signOut(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:Border.all(color: Colors.lightBlue.shade800),color: Colors.white
                    ),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Log Out',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
