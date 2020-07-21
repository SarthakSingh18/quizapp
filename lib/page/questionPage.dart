import 'package:flutter/material.dart';
import 'package:quiz_app/database/dbCaller.dart';
import 'package:quiz_app/database/dbMapper.dart';
import 'package:quiz_app/model/data.dart';
import 'package:quiz_app/page/resultPage.dart';
import 'package:quiz_app/page/routerPage.dart';
import 'package:quiz_app/repository/repository.dart';

import 'dataBuild.dart';

class QuestionPage extends StatefulWidget {
  final String text;
  const QuestionPage({Key key, this.text}) : super(key: key);
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Future<List<DbMapper>> dbmapper;
  Repository repository;
  DbCaller dbCaller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repository = Repository();
    dbCaller=DbCaller();
    dbmapper = dbCaller.get();
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: repository.getData(widget.text),
        builder: (context, AsyncSnapshot<Data> snapshot) {
          switch (snapshot.connectionState) {
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
              if (!snapshot.hasError && snapshot.hasData) {
                print("now in questionPage");
                return (Databuild(data: snapshot.data));
              } else {
                return (TeamCodeError());
              }
              break;
          }
          return Text("Sorry");
        });
  }
}

class TeamCodeError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Error",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 80),
              child: Text(
                "Enter valid Team Code",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, top: 10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.blueAccent,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Router()));
                },
                child: Container(
                  color: Colors.blueAccent,
                  width: 160,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back, color: Colors.black),
                      Text("Back To Main Page")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
