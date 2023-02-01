import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
class HttpResponse extends ChangeNotifier{
  List data=[];
  final  box= Hive.box('News');
  final url=Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2023-01-01&sortBy=publishedAt&apiKey=f1dbeef6d96e406698cf2373b5b152cc');
  Future<void> getResponse() async{

    print('df');
    try {
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      print(response.body);
      data = json['articles'].toList();
      notifyListeners();
      changeDateFormat(json['articles'].toList());
      box.put('data', json['articles'].toList());
      //notifyListeners();
    }catch(e){
      print(e);
    }
  }
  void changeDateFormat(List data){
    List dates=[];
    data.forEach((element) {
      String date=element['publishedAt'].toString().substring(0,10);
      String formatDate=Jiffy(date).yMMMMd;
      print(formatDate);

      dates.add(formatDate);
    });
    box.put('dates', dates);
  }
}