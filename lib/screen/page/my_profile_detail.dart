import 'package:cricketfantasy/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icons.dart';

class MyProfileDetailScreen extends StatefulWidget {
  const MyProfileDetailScreen({Key? key}) : super(key: key);
  @override
  createState() => _MyProfileDetailState();
}

class _MyProfileDetailState extends State<MyProfileDetailScreen> {
  var box;
  User? user;

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  void getEmployees() {
    box = Hive.box<User>('myBox');
    setState(() {
      user=(box.values.toList())[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {}, child: Icon(LineIcons.edit)),
        body: ListView(padding: EdgeInsets.all(0),
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              myProfile('Name', user!.name!),
              myProfile('Email', user!.email!),
              myProfile('Mobile', user!.phone!),
              myProfile('Birth Date', user!.date!),
              myProfile('Gender', user!.gender!=null?user!.gender!:""),
              myProfile('Country', user!.country!=null?user!.country!:""),
              myProfile('State', user!.state!=null?user!.state!:""),
              myProfile('City', user!.city!=null?user!.city!:"")
            ]));
  }

  myProfile(String title, String response) => Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child:
                          Text(title, style: TextStyle(color: Colors.black54))),
                  Container(child: Text(response))
                ])),
        Divider()
      ]);
}
