import 'package:flutter/material.dart';
import 'package:quiz_app/database/dbCaller.dart';
import 'package:quiz_app/database/dbMapper.dart';
import 'package:quiz_app/model/data.dart';
import 'package:quiz_app/page/resultPage.dart';

class Databuild extends StatefulWidget {
  final Data data;

  const Databuild({Key key, this.data}) : super(key: key);

  @override
  _DatabuildState createState() => _DatabuildState();
}

class _DatabuildState extends State<Databuild> {
  DbCaller dbCaller;
  double optionAElevation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbCaller = DbCaller();
    optionAElevation = 0;
  }

  drawer(List<DbMapper> dbMapper) {
    print(dbMapper);
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Sarthak Singh"),
            accountEmail: Text(
              "Sarthaksingh0900@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            decoration: BoxDecoration(color: Colors.black),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "S",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Hello in nav bar"),
            subtitle: Text("HIHI"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("QuizApp"),
          backgroundColor: Colors.black,
        ),
//          drawer: FutureBuilder(future:dbCaller.get(),builder:(context,AsyncSnapshot<List<DbMapper>> snapshot){
//            switch(snapshot.connectionState){
//              case ConnectionState.none:
//                // TODO: Handle this case.
//                break;
//              case ConnectionState.waiting:
//                // TODO: Handle this case.
//                break;
//              case ConnectionState.active:
//                // TODO: Handle this case.
//                break;
//              case ConnectionState.done:
//                return !snapshot.hasError&&snapshot.hasData?
//                       drawer(snapshot.data)
//                       :Center(child: Text("Error"),);
//                break;
//            }
//            return Text("Hello");
//          }),
//        drawer: Drawer(
//          child: ListView(
//            children: <Widget>[
//              UserAccountsDrawerHeader(
//                accountName: Text("Sarthak Singh"),
//                accountEmail: Text(
//                  "Sarthaksingh0900@gmail.com", style: TextStyle(
//                  fontWeight: FontWeight.w500,
//                ),),
//                decoration: BoxDecoration(
//                    color: Colors.black
//                ),
//                currentAccountPicture: CircleAvatar(
//                  backgroundColor: Colors.white,
//                  child: Text("S", style: TextStyle(fontSize: 40.0),),
//                ),
//              ),
//              ListTile(
//                title: Text("Hello in nav bar"),
//                subtitle: Text("HIHI"),
//              )
//            ],
//          ),
//        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 10),
                child: Text(
                  "Question ${widget.data.questions[0].qno}/10",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 11.0, left: 15.0, right: 15.0),
                child: Text(
                  widget.data.questions[0].q,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 100.0, right: 30),
                child: GestureDetector(
                  onTap: () {
                    print(optionAElevation);
                    if (optionAElevation == 0)
                      setState(() {
                        optionAElevation = 10;
                      });
                    else
                      setState(() {
                        optionAElevation = 0;
                      });
                  },
                  child: Material(
                    shadowColor: Colors.red.shade800,
                    elevation: optionAElevation,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      height: 50,
                      width: 500,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.data.questions[0].a),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10.0, right: 30),
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
                        child: Text(widget.data.questions[0].b),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10.0, right: 30),
                child: GestureDetector(
                  onTap: () {
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
                          child: Text(widget.data.questions[0].c),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10.0, right: 30),
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0)
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
                        child: Text(widget.data.questions[0].d),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0, top: 10),
                child: RaisedButton.icon(onPressed: () async{
                  DbMapper dbmapper = new DbMapper(
                      widget.data.questions[0].qno,
                      widget.data.questions[0].q);
                  await dbCaller.save(dbmapper);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ResultPage()));
                }, icon: Icon(Icons.arrow_forward), label:Text( "Next",),
                shape: StadiumBorder(),
                color: Colors.blue,),
              )
            ],
          ),
        ));
  }
}
