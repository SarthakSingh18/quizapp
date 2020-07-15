import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/page/questionPage.dart';

class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  TextEditingController textEditingController=new TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("QuizApp", style: TextStyle(fontWeight: FontWeight.w800)),
          elevation: 18,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextField(
                  maxLines: 1,
                  maxLength: 5,
                  autofocus: true,
                  cursorColor: Colors.black,
                  cursorWidth: 4.0,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: "Enter Test Code Here",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:5),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.blue)
                  ),
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(8.0),
                  onPressed: (){
                    if(textEditingController.text!=""){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuestionPage(text:textEditingController.text)));}
                      else{
                      scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text("Please enter Test Code")));
                    }
                  },
                  child: Container(
                    color: Colors.blueAccent,
                    width:100,
                    child: Row(
                      children: <Widget>[
                        Text("Open Quiz"),
                        Icon(Icons.arrow_forward,color:Colors.black)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
