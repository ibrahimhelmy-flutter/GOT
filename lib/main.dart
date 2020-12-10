import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotapp/epsiodes_page.dart';
import 'package:gotapp/got.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber,fontFamily: "Pacifico"),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url =
      "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes";
  Got got;

//  String name = "old";
  Widget myCard() {
    return Card(
      clipBehavior: Clip.antiAlias,

      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              " ${got.name}",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue,fontFamily: "Pacifico"),
            ),
          ),
          Hero(

            tag: "ib",
            child: CircleAvatar(
              backgroundImage: NetworkImage(got.myImage.original),
              radius: 100.0,
            ),
          ),

          Text(
            "RunTime :${got.runtime}",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Text("Summary : ${got.summary}"),
          RaisedButton(
            hoverColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.red)
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EpisodesPage(
                          got.embedded.episodes, got.myImage.original)));
            },
            child: Text("All Episodes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            color: Colors.amber[600],
          )
        ],
      ),
    );
  }

  Widget myBody() {
    return got == null ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(child: myCard());
  }

  @override
  void initState() {
    super.initState();
    fetchEpisodes();
  }

  fetchEpisodes() async {
    var res = await http.get(url);
    got = gotFromJson(res.body);
    setState(() {
      //name = got.name.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,

      body: SafeArea(child: myBody()),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.refresh),
      // ),
    );
  }
}
