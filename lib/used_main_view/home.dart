import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:quamtum_it_solutions/medicine/add_medicine.dart';
import 'package:quamtum_it_solutions/user/profile_settings.dart';

import '../main.dart';
class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  late StreamSubscription subscription;
  var isDeviceConnected=false;
  bool isAlert=false;
  final firebase= FirebaseFirestore.instance.collection('medicine');
Map<String,Color> medicineColor={
  'blue':Colors.blue,
  'red':Colors.red,
  'green':Colors.green,
  'pink':Colors.pink,
  'orange':Colors.orange
};
  int _bottomNavIndex=0;
  @override
  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      RemoteNotification? notification= message.notification;
      AndroidNotification? androidNotification= message.notification?.android;
      if(notification!=null &&androidNotification!= null) {
        print(message.data.toString());
        Map<String,dynamic> data=message.data;
        print('${data['order_id']}');
        //Navigator.pushNamed(context, RoutesName.orderId,arguments: data);

      }
    });
    checkInternetConnection();
    getConnectivity();
    // TODO: implement initState
    super.initState();
  }
  void checkInternetConnection()async{
    isDeviceConnected= await InternetConnectionChecker().hasConnection;
    if(!isDeviceConnected){
      showAlert();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: (){
          flutterLocalNotificationsPlugin.show(
              0,
              " Title here",
              " Description here",
              NotificationDetails(
                  android: AndroidNotificationDetails(
                      channel.id,
                      channel.name,
                      playSound: true,
                      importance: Importance.high,
                      icon: '@mipmap/ic_launcher'
                  )
              )
          );
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddMedicine()));
        },child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: Colors.black,),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            Icons.home,
            Icons.report,
          ],
          activeIndex: _bottomNavIndex,
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          onTap: (index) {
          setState(() => _bottomNavIndex = index);
          }
          //other params
        ),
        appBar: PreferredSize(
          preferredSize: Size(120,60),
          child: AppBar(title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hi Harry!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 8,), Text('5 Medicines left!',style: TextStyle(fontWeight: FontWeight.w600,
                    color: Colors.grey,fontSize: 18),)

              ],
            ),
          ),backgroundColor: Colors.white,shadowColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.health_and_safety_outlined,color: Colors.blue,size: 30,),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserProfile()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0,left: 8),
                  child:CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.jpg'),
                    radius: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: StreamBuilder(builder: ( context,  snapshot) {
          int? index= snapshot.data!.docs.length;
          if(snapshot.hasData){
            //var date=Jiffy("${data['createdAt']}").yMMMd;
            return ListView.builder(
              itemCount: index,
                itemBuilder: (context,index){
              Map<String,dynamic> data= snapshot.data!.docs[index].data() as Map<String,dynamic>;
              var fromDate= Jiffy('${data['createdAt'].toString().substring(0,10)}').yMMMd;
              var toDate=Jiffy('${data['createdAt'].toString().substring(13,23)}').yMMMd;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("${data['color'].toString().toUpperCase()}",style: TextStyle(color:medicineColor['${data['color']}'] ,fontSize: 18,
                                fontWeight: FontWeight.bold),),
                                Spacer(),
                                Text('${data['compartment']}',style: TextStyle(
                                  color: Colors.grey,fontSize: 14
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0,left: 8),
                            child: Text('${data['type'].toString().toUpperCase()}',style: TextStyle(
                                color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("${data['quantity'].toString().toUpperCase()}",style: TextStyle(color:medicineColor['${data['color']}'] ,fontSize: 16,
                                    fontWeight: FontWeight.w400),),
                                Spacer(),
                                Text('${fromDate.toString().substring(0,5)+" - "+toDate.toString().substring(0,6)}',style: TextStyle(
                                    color: Colors.grey,fontSize: 14
                                ),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });

          }else{
            return Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/3.png',fit: BoxFit.cover,)),
            );
          }
        },
          stream: firebase.snapshots(),

        )
      ),
    );
  }

  void getConnectivity() {
    subscription= Connectivity().onConnectivityChanged.listen((event) async {
      print('kgd');
      isDeviceConnected= await InternetConnectionChecker().hasConnection;
      if(!isDeviceConnected && !isAlert){
        showAlert();
        setState(() {
          isAlert=true;
        });
      }
    });
  }
  void showAlert(){
    showCupertinoDialog(context: context, builder: (BuildContext context){
      return CupertinoAlertDialog(
        title:Text('No Internt Connection'),
        content: Text('please check the connection'),
        actions: [
          TextButton(onPressed: ()async{
            Navigator.pop(context,'Cancel');
            isDeviceConnected= await InternetConnectionChecker().hasConnection;
            if(!isDeviceConnected){
              showAlert();
            }
          }, child: Text('Ok'))
        ],
      );
    });
  }
}
