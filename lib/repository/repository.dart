import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/model/data.dart';
class Repository{
  String url='http://192.168.56.1:3000';
  Future<Data> getData() async{
    Map<String,String>headers={
      "room_id":'111',
    };
    http.Response response=await http.get('$url/getQuestions',headers: headers);
    print("body"+response.body);
    Map<String,dynamic> jsonResponse=jsonDecode(response.body);
    print(jsonResponse);
    return Data.fromJson(jsonResponse);

  }
}