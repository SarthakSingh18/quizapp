import 'package:flutter/material.dart';
import 'package:quiz_app/model/data.dart';
import 'package:quiz_app/page/resultPage.dart';
import 'package:quiz_app/page/routerPage.dart';
import 'package:quiz_app/repository/repository.dart';
class QuestionPage extends StatefulWidget {
  final String text;
  const QuestionPage({Key key, this.text}) : super(key: key);
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
    return FutureBuilder(future: repository.getData(widget.text),builder: (context,AsyncSnapshot<Data> snapshot){
      switch(snapshot.connectionState) {
        case ConnectionState.none:
        // TODO: Handle this case.
          break;
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
          break;
        case ConnectionState.active:
        // TODO: Handle this case.
          break;
        case ConnectionState.done:
          if(!snapshot.hasError&&snapshot.hasData){
            return(DataBuild(data: snapshot.data));
          }
          else{
            return(TeamCodeError());
          }
          break;
      }
      return Text("Sorry");
    });
  }
}


class TeamCodeError extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Error",style: TextStyle(
          fontWeight: FontWeight.w700
        ),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 80),
              child: Text("Enter valid Team Code",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
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



class DataBuild extends StatelessWidget{
  final Data data;

  const DataBuild({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("QuizApp"),
          backgroundColor: Colors.black,
        ),
        body:Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:80.0,left: 10),
                child: Text("Question ${data.questions[0].qno}/10",style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800
                ),),),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Divider(color: Colors.black,),
              ),
              Padding(
                padding: const EdgeInsets.only(top:11.0,left: 15.0,right: 15.0),
                child: Text(data.questions[0].q,style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:30,top:100.0,right: 30),
                child: GestureDetector(
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
                          child: Text(data.questions[0].a),
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
                        child: Text(data.questions[0].b),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:30,top:10.0,right: 30),
                child: GestureDetector(
                  onTap: (){
                    print('Hello World');
                  },
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
                          child: Text(data.questions[0].c),
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
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        spreadRadius: 2.0
                      )
                    ],
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data.questions[0].d),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:150.0,top: 10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.blue)
                  ),
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(8.0),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResultPage()));
                  },
                  child: Container(
                    color: Colors.blueAccent,
                    width:70,
                    child: Row(
                      children: <Widget>[
                        Text("Next"),
                        Icon(Icons.arrow_forward,color:Colors.black)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }


}