import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  final firebase= FirebaseFirestore.instance.collection('medicine');
  Map<String,Color> medicineColor={
    'blue':Colors.blue,
    'red':Colors.red,
    'green':Colors.green,
    'pink':Colors.pink,
    'orange':Colors.orange
  };

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: ( context,  snapshot) {
      int? index= snapshot.data!.docs.length;
      if(snapshot.connectionState==ConnectionState.waiting){
        return CircularProgressIndicator(color: Colors.blue,strokeWidth: 3,);
      }
      else if(snapshot.hasData){
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

    );
  }
}
