import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // let's get data from https://jsonplaceholder.typicode.com/albums/1
  Future<Album> getAlbumById(int id) async {
    var response = await http.get('https://jsonplaceholder.typicode.com/albums/' + id.toString());
    // check http restponse
    log("response code ->" + response.statusCode.toString());
    // check http response body
    log("response body ->" + response.body);
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  // let's get data from https://jsonplaceholder.typicode.com/albums
  Future<List<Album>> getAllAlbum() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/albums');
    // check http restponse
    log("->" + response.statusCode.toString());
    // check http response body
    log("->" + response.body);
    if (response.statusCode == 200) {
      // auto parse
      var jsonData = albumFromJson(response.body);
      // return list of album
      return jsonData;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // test call http repuest

    // getAlbumById(1).then((album) {
    //   log("--- album data ---");
    //   log("album id ->" + album.id.toString());
    //   log("album title ->" + album.title);
    // });

    // getAllAlbum().then((value) {
    //   log("->" + value.length.toString());
    //   log("->" + value.first.id.toString());
    //   log("->" + value.first.title);
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Json PlaceHolder")),
      body: Container(),
    );
  }
}

class Album {
  int userId;
  int id;
  String title;

  Album({this.userId, this.id, this.title});

  Album.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

// see auto parse in flutter cookbook
List<Album> albumFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

String albumToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
