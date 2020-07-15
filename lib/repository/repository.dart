import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/model/data.dart';
import 'package:quiz_app/page/resultPage.dart';
class Repository{
  String url='http://192.168.56.1:3000';
  Future<Data> getData(String text) async{
    Map<String,String>headers={
      "room_id":text,
    };
    http.Response response=await http.get('$url/getQuestions',headers: headers);
    print("body"+response.body);
    if(response.statusCode==200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return Data.fromJson(jsonResponse);
    }
    else{
      return null;
    }
  }
}