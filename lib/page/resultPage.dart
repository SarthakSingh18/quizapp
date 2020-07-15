import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/page/routerPage.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Result"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:60.0,top: 30.0),
              child: Text("Your Test has been submitted",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize:  20
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:70,top: 10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.blue)
                ),
                color: Colors.blueAccent,
                padding: EdgeInsets.all(8.0),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Router()));
                },
                child: Container(
                  color: Colors.blueAccent,
                  width:160,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back,color:Colors.black),
                      Text("Back To Main Page")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
