import 'package:flutter/material.dart';
import 'package:quiz_app/repository/repository.dart';
class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Repository repository;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repository=Repository();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuizApp"),
      ),
      body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:80.0,left: 10),
              child: Text("Question 1/10",style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800
              ),),),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Divider(color: Colors.black,),
              ),
            Padding(
              padding: const EdgeInsets.only(top:11.0,left: 15.0,right: 15.0),
              child: Text("What attraction in Montreal is one of the largest in the world?",style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30,top:100.0,right: 30),
              child: GestureDetector(
                onTap: ()=>{
                  print(repository.getData())},
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("The Botanical Garden"),
                        ),
                      ],
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30,top:10.0,right: 30),
              child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("The Botanical Garden"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30,top:10.0,right: 30),
              child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("The Botanical Garden"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30,top:10.0,right: 30),
              child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("The Botanical Garden"),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(onPressed: (){},
              child:Row(
             children: <Widget>[
              Text("Submit"),
              Icon(Icons.arrow_forward,color: Colors.black,),
            ],
            ),)
          ],
        ),
      )
    );
  }
}
