import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quamtum_it_solutions/firebase-auth/firebase_login_gmail_password.dart';
import 'package:quamtum_it_solutions/used_main_view/chat.dart';
class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<String>messageId=[];
  @override
  void initState() {
    print(FirebaseAuth.instance.currentUser?.displayName);
    // TODO: implement initState
    super.initState();
  }
  Future<void> _getUserName() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(('Shaik khaleel')).get()
        .then((value) {
      setState(() {
        Map<String, dynamic>? data= value.data();
        Url=data!['profileUrl'].toString();
        print(Url);
      });
    });
  }
  String Url='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: FutureBuilder(
          future: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.displayName).get(),
            builder:(context,snapshot){
            if(snapshot.hasData) {
              Map<String, dynamic>? ref = snapshot.data!.data();
              print(ref?.values);
              print(FirebaseAuth.instance.currentUser!.displayName);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      image:ref!['profileUrl']!=null? DecorationImage(
                          image: NetworkImage("${ref['profileUrl']}"),fit: BoxFit.cover
                      ):DecorationImage(image: AssetImage('assets/dummy.png'))
                  ),),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(color: Colors.black,),
              );
            }
    },),
        title: const Text('My People',style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.w600
        ),),centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.connectionState != ConnectionState.waiting) {
            return ListView.builder(itemBuilder: (context, index) {
              Map<String, dynamic> data = snapshot.data!.docs[index]
                  .data() as Map<String, dynamic>;
              return FirebaseAuth.instance.currentUser?.displayName.toString()!=data['username'].toString()?
              InkWell(
                onTap: ()async{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatScreen(profileUrl: data['profileUrl']!=null?data['profileUrl']:'assets/dummy.png',
                      title: data['username'])));
                  FirebaseAuthentication.getData(data['username']);
                 },
                child: ListTile(
                  title: Text('${data['username']}',
                    style: TextStyle(fontWeight: FontWeight.w600,
                        fontSize: 16),),
                  subtitle: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('chats').doc(FirebaseAuthentication.
                    generateChatId("${data['username']}")).collection(DateTime.now().toString().substring(0,10))
                        .orderBy('createdAt',descending: false).snapshots(),
                    builder: (BuildContext context, snapshot) {
                      Map<String,dynamic> data=snapshot.data!.docs.isNotEmpty?
                      snapshot.data!.docs[snapshot.data!.docs.length-1].data():
                      {'message':"No Chats",'createdAt':'no data','seen':true};
                      if(snapshot.hasData){
                        return Text('${data['username']==FirebaseAuth.instance.currentUser!.displayName?'you : ':''}'+'${data['message']}',style: TextStyle(color: data['seen']==false&& data['username']!=FirebaseAuth.instance.currentUser!.displayName?Colors.blue:Colors.grey,
                        fontWeight:data['seen']==false&& data['username']!=FirebaseAuth.instance.currentUser!.displayName?FontWeight.w700:FontWeight.w400 ),);
                      }else{
                        return CircularProgressIndicator(
                          color: Colors.blue,
                        );
                      }
                    },
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8.0,right: 8,bottom: 8),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                          image:data['profileUrl']!=null? DecorationImage(
                              image: NetworkImage("${data['profileUrl']}"),fit: BoxFit.cover
                          ):DecorationImage(image: AssetImage('assets/dummy.png'))
                      ),),
                  ),
                ),
              ): SizedBox(
                height: 0,
              );
            }, itemCount: snapshot.data!.docs.length,);
          }else{
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,strokeWidth: 3,
              ),
            );
          }
        },
      ),
    );
  }

  Future readUser()async {
    final docUser= FirebaseFirestore.instance.collection('users').doc('Shaik Khaleel');
    final snapShot= await docUser.get();

  }
}
