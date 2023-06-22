import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  late String profileUrl;
  late String title;

  ChatScreen({super.key, required this.profileUrl, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String chatRefId='';
  @override
  void initState() {
    generateChatId();
    // TODO: implement initState
    super.initState();
  }
  void generateChatId(){
    List chatId=[];
    chatId.add(FirebaseAuth.instance.currentUser?.displayName.toString());
    chatId.add(widget.title);
    chatId.sort();
    setState(() {
      chatRefId=chatId[0]+' '+chatId[1];
    });
    chatId.clear();
    chatId=chatRefId.split(' ');
    setState(() {
      chatRefId='';
    });
    chatId.forEach((element) {
      setState(() {
        chatRefId+=element;
      });
    });
    print(chatRefId);
  }
  TextEditingController message=TextEditingController();
  ScrollController controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(100,100),
          child:  Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                        icon: Icon(Icons.arrow_back_sharp,color: Colors.white,)),
                    SizedBox(width: 16,),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                          image:widget.profileUrl!='assets/dummy.png'? DecorationImage(
                      image: NetworkImage("${widget.profileUrl}"),fit: BoxFit.cover
                    ):DecorationImage(image: AssetImage('assets/dummy.png'),fit: BoxFit.cover)
                      ),),
                    SizedBox(width: 16,),
                    Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),)
                  ],
                ),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('chats').doc(chatRefId).collection(DateTime.now().toString().substring(0,10))
              .orderBy('createdAt',descending: false).snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState!=ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 8),
                child:
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index].data();
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        mainAxisAlignment:data['username'].toString()==FirebaseAuth.instance.currentUser!.displayName? MainAxisAlignment.end:
                        MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child:data['message'].toString().length<40? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: data['username'].toString()==FirebaseAuth.instance.currentUser!.displayName?Colors.blue
                                :Colors.black,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12),
                                    child: Text('${data['message']}',
                                          style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.w600,fontSize: 16),)),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, right: 12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('${data['createdAt'].toString().substring(0,2)}:${data['createdAt'].toString().substring(2,4)}',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,
                                              fontSize: 10),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ):Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: data['username'].toString()==FirebaseAuth.instance.currentUser!.displayName?Colors.blue
                                    :Colors.black,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12),
                                        child: Text('${data['message']}',
                                          style: TextStyle(color: Colors.white,fontSize: 16,
                                              fontWeight: FontWeight.w600),),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, right: 12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('${data['createdAt'].toString().substring(0,2)}'
                                            ':${data['createdAt'].toString().substring(2,4)}',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,
                                              fontSize: 10),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                    controller: controller,
                    itemCount: snapshot.data!.docs.length,),
                ),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          },
        ),
        backgroundColor: Colors.white,
        bottomSheet: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                color: Colors.white,
                child: TextField(
                  controller: message,
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 16,
                    fontWeight: FontWeight.w500)
                  ),
                ),
              ),
              IconButton(onPressed: (){
                addMessage();
                controller.animateTo(controller.position.maxScrollExtent, duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
                setState(() {
                  message.text='';
                });
              }, icon: Icon(Icons.send,color: Colors.black,))
            ],
          ),
        ),
      ),
    );
  }

  void addMessage(){
    String created=DateTime.now().toString();
    List<String> time=created.substring(11,19).split(':');
    String nowTime='';
    for (var element in time) {
      nowTime+=element;
    }
    final ref=FirebaseFirestore.instance.collection('chats').doc(chatRefId).collection(created.substring(0,10))
        .doc(FirebaseAuth.instance.currentUser!.displayName!+nowTime);

    print(nowTime);
    ref.set({
      'username':FirebaseAuth.instance.currentUser!.displayName,
      'message':message.text.toString(),
      'createdAt':int.parse(nowTime),
      'seen':false
    });
  }
}
