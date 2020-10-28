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
  Future<Album> fetchAlbum() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<Album>> fetchAllAlbum() async {
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesom Photo"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchAllAlbum(),
          builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].title),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return PhotoPage(albumId: snapshot.data[index].id);
                    }));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class PhotoPage extends StatefulWidget {
  final int albumId;
  PhotoPage({Key key, this.albumId}) : super(key: key);

  @override
  _PhotoPageState createState() => _PhotoPageState(this.albumId);
}

class _PhotoPageState extends State<PhotoPage> {
  int albumId;
  _PhotoPageState(this.albumId);

  Future<List<Photo>> fetchPhotoAlbum(int albumId) async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/photos?albumId=' + albumId.toString());

    // check http restponse
    log("->" + response.statusCode.toString());
    // check http response body
    log("->" + response.body);
    if (response.statusCode == 200) {
      // auto parse
      var jsonData = photoFromJson(response.body);
      // return list of album
      return jsonData;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album ID =" + albumId.toString()),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchPhotoAlbum(albumId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(snapshot.data[index].thumbnailUrl),
                    title: Text(snapshot.data[index].title),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
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

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

// see auto parse in flutter cookbook
List<Photo> photoFromJson(String str) =>
    List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));

String photoToJson(List<Photo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
