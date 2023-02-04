import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quamtum_it_solutions/show-messages/show_message.dart';
class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
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

  String? compartment;
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0,left: 16,right: 16),
              child: Text('Compartment',style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 8,bottom: 0,left:16,right: 16 ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: DropdownButton2(
                  hint: const Text(
                    'Select Compartment',
                    style: TextStyle(
                        fontSize: 18,
                        color:Colors.black
                    ),
                  ),
                  items: items
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
                  value: compartment,
                  onChanged: (value) {
                    setState(() {
                      compartment = value as String;
                    });
                  },
                  buttonDecoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  dropdownOverButton: true,
                  dropdownDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 2)

                  ),
                  buttonHeight: 40,
                  buttonWidth: MediaQuery.of(context).size.width,
                  buttonPadding: EdgeInsets.all(10),
                  scrollbarAlwaysShow: true,
                  itemHeight: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0,left: 16,right: 16),
              child: Text('Medicine Color',style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 8,bottom: 0,left:16,right: 16 ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: DropdownButton2(
                  hint: const Text(
                    'Select Color',
                    style: TextStyle(
                        fontSize: 18,
                        color:Colors.black
                    ),
                  ),
                  items: colors
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
                  value: medicineColor,
                  onChanged: (value) {
                    setState(() {
                      medicineColor = value as String;
                    });
                  },
                  buttonDecoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  dropdownOverButton: true,
                  dropdownDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 2)

                  ),
                  buttonHeight: 40,
                  buttonWidth: MediaQuery.of(context).size.width,
                  buttonPadding: EdgeInsets.all(10),
                  scrollbarAlwaysShow: true,
                  itemHeight: 40,
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(top: 16.0,left: 16,right: 16),
              child: Text('Medicine Type',style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 8,bottom: 0,left:16,right: 16 ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: DropdownButton2(
                  hint: const Text(
                    'Select Type',
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
                  buttonDecoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  dropdownOverButton: true,
                  dropdownDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 2)

                  ),
                  buttonHeight: 40,
                  buttonWidth: MediaQuery.of(context).size.width,
                  buttonPadding: EdgeInsets.all(10),
                  scrollbarAlwaysShow: true,
                  itemHeight: 40,
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(top: 16.0,left: 16,right: 16),
              child: Text('Quantity',style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 8,bottom: 0,left:16,right: 16 ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: DropdownButton2(
                  hint: const Text(
                    'Select Quantity',
                    style: TextStyle(
                        fontSize: 18,
                        color:Colors.black
                    ),
                  ),
                  items: quantity
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
                  value: medicineQuantity,
                  onChanged: (value) {
                    setState(() {
                      medicineQuantity = value as String;
                    });
                  },
                  buttonDecoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  dropdownOverButton: true,
                  dropdownDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 2)

                  ),
                  buttonHeight: 40,
                  buttonWidth: MediaQuery.of(context).size.width,
                  buttonPadding: EdgeInsets.all(10),
                  scrollbarAlwaysShow: true,
                  itemHeight: 40,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 16.0,left: 16,right: 16),
              child: Text('Select Date',style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 8,bottom: 0,left:16,right: 16 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black,),
                    borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Today',style: TextStyle(
                        fontWeight: FontWeight.w800,fontSize: 18
                      ),),
                    ),
                  ),
                  Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('-',style: TextStyle(
                          fontWeight: FontWeight.w800,fontSize: 18
                      ),),
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
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black,),color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(date=='no date'?'Select Date':date.substring(0,10),style: TextStyle(
                            fontWeight: FontWeight.w800,fontSize: 18,color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 32.0,left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Map<String,dynamic> medicineData={
                        'compartment':compartment,
                        'color':medicineColor,
                        'type':medicineType,
                        'quantity':medicineQuantity,
                        'createdAt':'${dateTime.toString().substring(0,10)} - ${date.toString().substring(0,10)}'
                      };
                      firebase.add(medicineData);
                      ShowMessage.displayMessage('Successfully Added', context, Colors.blue);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black,),
                          borderRadius: BorderRadius.circular(10),color: Colors.blue),
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
    );
  }
}
