import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> main = [];
  List<dynamic> ab=[];
  var indexvalue;
  bool displayCommitDetail = false;

  Future<void> getcommitrequest() async {
    try {
      var url = Uri.https('api.github.com', 'repos/flutter/flutter/commits');
      // Await the http get response, then decode the json-formatted response.
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var resp = convert.jsonDecode(response.body);
        setState(() {
          main = resp;
        });
      }
    } catch (e) {
      print("aman");
      print(e);
    }
  }

  Future<void> commit() async {
    try {
      var url = Uri.parse(main[indexvalue]["commit"]["tree"]["url"]);

      // Await the http get response, then decode the json-formatted response.
      final response = await http.get(url);
      if (response.statusCode == 200) {
        ab = convert.jsonDecode(response.body) as List;

        print(ab);
      }
    } catch (e) {
      print("aman1");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getcommitrequest();

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter/Flutter Last Commmit"),
        ),
        body: displayCommitDetail == false
            ? Container(
                child: ListView.builder(
                    itemCount: main.length,
                    itemBuilder: (context, i) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("sha:  ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  main[i]["sha"].toString(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("node id:  ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  main[i]["node_id"].toString(),
                                ),
                              ],
                            ),


                            Text("Commit  ",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text("Author  ",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text("Name  ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["author"]["name"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Email  ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["author"]["email"]),
                              ],
                            ),Row(
                              children: [
                                Text("Date ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["author"]["date"]),
                              ],
                            ),
                            Text("Committer ",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text("Name  ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["committer"]["name"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Email  ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["committer"]["email"]),
                              ],
                            ),Row(
                              children: [
                                Text("Date ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["committer"]["date"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Message ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["message"]),
                              ],
                            ),
                            Text("Tree ",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text("Sha ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["tree"]["sha"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Url ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["tree"]["url"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Comment Count ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["comment_count"].toString()),
                              ],
                            ), Text("Verification ",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold)),



                            Row(
                              children: [
                                Text("verified ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["verification"]["verified"].toString()),
                              ],
                            ),Row(
                              children: [
                                Text("reason",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["verification"]["reason"]),
                              ],
                            ),Row(
                              children: [
                                Text("Sigature  :",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["verification"]["signature"]),
                              ],
                            ),Row(
                              children: [
                                Text("payload :",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(main[i]["commit"]["verification"]["payload"]),
                              ],
                            ),






// aman








                            FlatButton(
                                color: Colors.black,
                                textColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    indexvalue = i;
                                    commit();
                                    displayCommitDetail = true;
                                  });
                                },
                                child: Text("Click Button More Detail"))
                          ],
                        ),
                      );
                    }),
              )
            : Container(
                child: ListView.builder(
                    itemCount: ab.length,
                    itemBuilder: (context1, i) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("sha:  ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                               // Text(
                              //    main2[i]["tree"].toString(),
                               // ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("node id:  ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  main[i]["node_id"].toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })));
  }
}

