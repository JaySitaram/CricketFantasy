import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryDetailScreen extends StatefulWidget {
  const HistoryDetailScreen({Key? key}) : super(key: key);
  @override
  createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          myProfile('Contests', '00'),
          myProfile('Matches', '00'),
          myProfile('Series', '00'),
          myProfile('Wins', '00')
        ]);
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
