import 'dart:async';
import 'dart:io';
import 'package:battery_plus/battery_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  late StreamSubscription subscription;
  var isDeviceConnected=false;
  String CaptureTime='Captured Time';
  List<File> image=[];
  int captureCount=0;
  bool isAlert=false;
  Battery battery=Battery();
  final firebase= FirebaseFirestore.instance.collection('medicine');
  int _bottomNavIndex=0;
  int batteryCharge=0;
  int minutes=15;
  TextEditingController frequency=TextEditingController();
  void getImage()async{
    XFile? imageFile= await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image.add(File(imageFile!.path));
      captureCount++;
      CaptureTime=DateTime.now().toString();
    });
  }
  BatteryState state=BatteryState.unknown;
  bool status=true;
   void getBatteryStatus()async{
     int charge=await battery.batteryLevel;
     setState(() {
       batteryCharge=charge;
     });
   }
   Location location= Location();
  late bool _serviceEnabled;
   String _locationData='getting....';
   late Timer timer;
  @override
  void initState() {
    getLocationPermission();
    battery.onBatteryStateChanged.listen((event) {
      setState(() {
        state=event;
      });
    });
    getImage();
    timer=Timer.periodic(Duration(minutes: minutes), (timer) async{
       getImage();
    });
    checkInternetConnection();
    getConnectivity();
    getBatteryStatus();
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 5), (timer) async{
      getBatteryStatus();
    });
    super.initState();
  }
  void checkInternetConnection()async{
    isDeviceConnected= await InternetConnectionChecker().hasConnection;
    if(!isDeviceConnected){

    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "SECQur",style:GoogleFonts.adamina(color: Color.fromRGBO(
                          53, 177, 164, 1.0),fontSize: 20,)),
                      TextSpan(text: "AI",style: GoogleFonts.adamina(color:Color.fromRGBO(
                          188, 70, 49, 1.0),fontSize: 25)),
                      TextSpan(text: "SE",style:GoogleFonts.adamina(color: Color.fromRGBO(
                          53, 177, 164, 1.0),fontSize: 20)),
                    ]
                  )),
                  SizedBox(height: 50,),
                  Text('$CaptureTime',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                  SizedBox(height: 20,),
                  Container(
                    height: 150,
                    width: 150,
                    child: image.isNotEmpty?Image.file(image[image.length-1],fit: BoxFit.cover,):
                    Center(child: Text('Selected Image',style: GoogleFonts.poppins(color: Colors.white),)),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Capture Count',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                      fontSize: 18,color: Colors.white),),
                      Text('$captureCount',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.green),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      showCupertinoDialog(context: context, builder: (context){
                        return CupertinoAlertDialog(
                          title: Text("Enter Frequency"),
                          content: Material(
                            child: TextField(
                              controller: frequency,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Freq(min)',
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                              setState(() {
                                minutes=int.parse(frequency.text);
                              });
                            }, child: Text('Set'))
                          ],
                        );
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Frequency(min)',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                            fontSize: 18,color: Colors.white),),
                        Text('$minutes',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                            fontSize: 18,color: Colors.green),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Connectivity',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.white),),
                      Text(isDeviceConnected?'ON':'OFF',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.green),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Battery Charging',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.white),),
                      Text(state==BatteryState.charging?"Yes":"No",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.green),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Battery Charge',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.white),),
                      Text('$batteryCharge%',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.green),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Location',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.white),),
                      Text('$_locationData',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                          fontSize: 18,color: Colors.green),),
                    ],
                  ),
                  SizedBox(height: 80,),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            image.clear();
                            captureCount=0;
                            CaptureTime="Captured Time";
                            _locationData="getting...";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>( Color.fromRGBO(
                              12, 129, 115, 1.0))
                        ),
                        child: Text('Refresh Data',style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getConnectivity() {
    subscription= Connectivity().onConnectivityChanged.listen((event) async {
      print('kgd');
       bool connected= await InternetConnectionChecker().hasConnection;
       setState(() {
         isDeviceConnected=connected;
       });
      if(!isDeviceConnected && !isAlert){
        setState(() {
          isAlert=true;
        });
      }
    });
  }

  void getLocationPermission() async{
    Permission location=Permission.location;
    final permission=await location.request();
    if(permission.isDenied){
      await location.request();
    }
    getLocationData();

  }

  void getLocationData()async{
    LocationData data = await location.getLocation();
    setState(() {
      _locationData="${data.latitude.toString()} : ${data.longitude.toString()}";
    });
  }

}
