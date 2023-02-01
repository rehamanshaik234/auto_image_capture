import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:quamtum_it_solutions/firebase-auth/firebase_login_gmail_password.dart';
import 'package:quamtum_it_solutions/http_response/http_response.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data=[];
  List dates=[];
@override
  void initState() {
    Provider.of<HttpResponse>(context,listen: false).getResponse();
    final  box= Hive.box('News');
    setState(() {
      data=box.get('data');
      dates=box.get('dates');
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Consumer<HttpResponse>(
        builder: (_,datas,r) {
          return ListView.builder(
              itemCount:data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(dates[index],
                                  style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                                SizedBox(height: 8,),
                                Text(data[index]['title'],
                                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w900),),
                               SizedBox(height: 8,),
                                Text(data[index]['description'],
                                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w200),),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.32,
                          child: Image.network(data[index]['urlToImage']!=null?data[index]['urlToImage']:'https://www.goog'
                              'le.com/search?q=no+image&sxsrf=AJOqlzWqIq-rtkY76JhDmNN4QHaCQXcIjQ:1675258612883&sou'
                              'rce=lnms&tbm=isch&sa=X&ved=2ahUKEwiDh5zUuPT8AhX1hOYKHQuPAxoQ_'
                              'AUoAXoECAEQAw&biw=1023&bih=471&dpr=1.33#imgrc=c9HhSMkB_LemLM',fit: BoxFit.cover,),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        FirebaseAuthentication.signOut(context);
      },
        child: Icon(Icons.logout,color: Colors.white,),
        backgroundColor: Colors.blue,tooltip: 'Logout',),
    );
  }
}
