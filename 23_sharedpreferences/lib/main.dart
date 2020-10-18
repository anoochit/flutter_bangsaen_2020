import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserModel()),
    ],
    child: MyApp(),
  ));
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
  var _profileMenu = ["Edit Profile", "Change Avatar", "Sign Out"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Stack(
              children: [
                Consumer<UserModel>(
                  builder: (BuildContext context, value, Widget child) {
                    if (value.avatar == "Anonymous") {
                      return CircleAvatar(
                        radius: 80.0,
                        child: Text(
                          value.username.substring(0, 2).toUpperCase(),
                          style: TextStyle(fontSize: 48),
                        ),
                      );
                    } else {
                      File imageFile = new File(value.avatar);
                      return CircleAvatar(
                        backgroundImage: FileImage(imageFile),
                        radius: 80.0,
                      );
                    }
                  },
                ),
                Positioned(
                  bottom: 1.0,
                  right: 1.0,
                  child: InkWell(
                    child: ClipOval(
                      child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.grey[300],
                          child: Icon(Icons.edit)),
                    ),
                    onTap: () {
                      // do something
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<UserModel>(
                builder: (BuildContext context, value, Widget child) {
                  return Text(
                    value.getUsername,
                    style: TextStyle(fontSize: 22.0),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.menu_book),
                    title: Text(_profileMenu[index]),
                    onTap: () {
                      // do something
                      switch (index) {
                        case 0:
                          // set username
                          var um = Provider.of<UserModel>(context, listen: false);
                          um.setUser("Darth Dart", um.avatar);
                          break;
                        case 1:
                          // choose image from image picker and save
                          ImagePicker imagePicker = new ImagePicker();
                          imagePicker.getImage(source: ImageSource.gallery).then((pickFile) {
                            //log(pickFile.path.toString());
                            var um = Provider.of<UserModel>(context, listen: false);
                            um.setUser(um.username, pickFile.path.toString());
                          });
                          break;
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserModel extends ChangeNotifier {
  String username = "";
  String avatar = "";

  String get getUsername => this.username;
  String get getAvatar => this.avatar;

  UserModel() {
    loadUser();
  }

  setUser(String username, String avatar) async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    pf.setString("username", username);
    pf.setString("avatar", avatar);
    this.username = username;
    this.avatar = avatar;
    notifyListeners();
  }

  loadUser() async {
    SharedPreferences pf = await SharedPreferences.getInstance();
    this.username = pf.getString("username") ?? "Anonymous";
    this.avatar = pf.getString("avatar") ?? "Anonymous";
    log("username -> " + this.username);
    log("avatar -> " + this.avatar);
    notifyListeners();
  }
}
