import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quamtum_it_solutions/show-messages/show_message.dart';
class AddMedicine2 extends StatefulWidget {
  const AddMedicine2({Key? key}) : super(key: key);

  @override
  State<AddMedicine2> createState() => _AddMedicine2State();
}

class _AddMedicine2State extends State<AddMedicine2> {
  double opacity=0.3;
  final firebase= FirebaseFirestore.instance.collection('medicine');
  List items=["1",'2','3','4','5'];
  List colors=['blue','red','green','pink','orange'];
  List type=['Capsule','tonic','eye-drop','tablet'];
  List quantity=['1/2','1','1 1/2','2','3'];
  String? medicineColor;
  String? medicineType;
  String? medicineQuantity;
  DateTime dateTime=DateTime.now();
  String date='no date';
  List<Color> tabletColors=[
    Colors.lightBlueAccent.withOpacity(0.3),
    Colors.red.withOpacity(0.3),
    Colors.green.withOpacity(0.3),
    Colors.purpleAccent.withOpacity(0.3),
    Colors.deepOrangeAccent.withOpacity(0.3),
    Colors.pinkAccent.withOpacity(0.3),
    Colors.yellow.withOpacity(0.3),
    Colors.blueAccent.withOpacity(0.3),
    Colors.deepPurpleAccent.withOpacity(0.3),
    Colors.cyanAccent.withOpacity(0.3)
  ];
  List<String> medicineNames=[
    'Tablet',
    'Capsule',
    'Cream',
    'Tonic',
    'Injection',
    'Tablet',
    'Capsule',
    'Cream',
    'Tonic',
    'Injection',
  ];
  String? compartment;
  double sliderValue = 0.3;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(120,60),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [

                Icon(Icons.arrow_back_ios,color: Colors.black,),
                SizedBox(
                  width: 8,
                ),
                Text('Add Medicine',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.search,color: Colors.grey,),
                        suffixIcon: Icon(Icons.mic,color: Colors.grey,),
                        hintText: 'Search Medicine Name',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w700)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Compartment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black,)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: Center(
                            child: Text('${index+1}',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Colour',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.blue.withOpacity(0.5),),color: tabletColors[index]),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Container(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              width: 60,
                              height: 60,
                              child: Column(
                                children: [
                                  Icon(Icons.medical_services,color: Colors.pink.withOpacity(0.4),size: 50,),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('${medicineNames[index]}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300),)
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Quantity',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width*0.6,
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey,),color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                            child: Center(child: Text('Take 1/2 Pill',style: TextStyle(fontWeight: FontWeight.w700),)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width*0.1,
                            decoration: BoxDecoration(border: Border.all(color: Colors.blue,),color: Colors.white),
                            child: Center(child: Text('-',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 35),)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width*0.1,
                            decoration: BoxDecoration(border: Border.all(color: Colors.blue,),color: Colors.blue),
                            child: Center(child: Text('+',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 28,color: Colors.white),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total Count',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Slider(
                          activeColor: Colors.blue,
                          value: sliderValue,
                          onChanged: (v){
                            setState(() {
                              sliderValue = v;
                            });
                          },
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('01',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                              Text('100',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Set Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 8,bottom: 0,left:8,right: 8 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*0.43,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black,),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Today',style: TextStyle(
                                  fontWeight: FontWeight.w800,fontSize: 18
                              ),),
                              Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 16,)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025)).then((value){
                            setState(() {
                              date=value.toString();
                            });

                          });
                        },
                        child:  Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width*0.43,
                          decoration: BoxDecoration(border: Border.all(color: Colors.black,),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('End Date',style: TextStyle(
                                    fontWeight: FontWeight.w800,fontSize: 18
                                ),),
                                Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 16,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Frequency of Days',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 8,bottom: 0,left:16,right: 16 ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: DropdownButton2(
                      hint: const Text(
                        'Select Days',
                        style: TextStyle(
                            fontSize: 18,
                            color:Colors.black
                        ),
                      ),
                      items: type
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black
                              ),
                            ),
                          ))
                          .toList(),
                      value: medicineType,
                      onChanged: (value) {
                        setState(() {
                          medicineType = value as String;
                        });
                      },
                      buttonDecoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                      dropdownOverButton: true,
                      dropdownDecoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black,width: 2)

                      ),
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width,
                      buttonPadding: EdgeInsets.all(10),
                      scrollbarAlwaysShow: true,
                      itemHeight: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('How many Times a Day',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 8,bottom: 0,left:16,right: 16 ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: DropdownButton2(
                      hint: const Text(
                        'Select Days',
                        style: TextStyle(
                            fontSize: 18,
                            color:Colors.black
                        ),
                      ),
                      items: type
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black
                              ),
                            ),
                          ))
                          .toList(),
                      value: medicineType,
                      onChanged: (value) {
                        setState(() {
                          medicineType = value as String;
                        });
                      },
                      buttonDecoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                      dropdownOverButton: true,
                      dropdownDecoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black,width: 2)

                      ),
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width,
                      buttonPadding: EdgeInsets.all(10),
                      scrollbarAlwaysShow: true,
                      itemHeight: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.access_time,color: Colors.grey,),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Dose 1",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,color: Colors.grey,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.access_time,color: Colors.grey,),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Dose 2",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,color: Colors.grey,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.access_time,color: Colors.grey,),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Dose 3",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,color: Colors.grey,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueAccent.withOpacity(0.4)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                          child: Text('Before Food',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),
                      ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                          child: Text('After Food',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                          child: Text('Before Sleep',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 32.0,left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: 40,
                          decoration: BoxDecoration(border: Border.all(color: Colors.white,),
                              borderRadius: BorderRadius.circular(20),color: Colors.blue.withOpacity(0.8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('Add',style: TextStyle(
                                  fontWeight: FontWeight.w800,fontSize: 18,color: Colors.white
                              ),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
