import 'package:cricketfantasy/screen/page/create_team.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'playerprofile.dart';

class ChooseCVCScreen extends StatefulWidget {
  Map<String, List<Player>>? team;
  ChooseCVCScreen({Key? key, this.team}) : super(key: key);

  @override
  createState() => _ChooseCVCState();
}

class _ChooseCVCState extends State<ChooseCVCScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Choose C and VC')),
        key: _scaffoldKey,
        body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(8),
                child: Center(
                    child: Text('Choose your Captain and Vice Captain',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )))),
            Container(
                margin: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(30.0),
                                border: new Border.all(
                                    width: 1.0, color: Colors.black54)),
                            child: Center(
                                child: Text('C',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold)))),
                        Text(' gets 2x points',
                            style: TextStyle(color: Colors.black54))
                      ]),
                      SizedBox(width: 8),
                      Row(children: <Widget>[
                        Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(30.0),
                                border: new Border.all(
                                    width: 1.0, color: Colors.black54)),
                            child: Center(
                                child: Text('VC',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54)))),
                        Text(' gets 1.5x points',
                            style: TextStyle(color: Colors.black54))
                      ])
                    ]))
          ]),
          Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.team!.keys.length,
                  itemBuilder: (context, index) {
                    // print(widget.team!.keys);
                    var key = widget.team!.keys.elementAt(index);
                    return PlayerWidget(
                      category: key,
                      value: widget.team![key],
                    );
                  }))
        ]));
  }
}

class PlayerWidget extends StatelessWidget {
  final List<Player>? value;
  final String? category;

  const PlayerWidget({Key? key, this.category, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        category != null
            ? Container(
                color: HexColor('#F5F5F5'),
                margin: EdgeInsets.only(bottom: 3),
                padding: EdgeInsets.all(5),
                child: Center(
                    child: Text(
                  category!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )))
            : SizedBox(),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(top: 0, bottom: 3),
                child: Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(children: <Widget>[
                      Container(
                          child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PlayerProfileScreen(),
                                      fullscreenDialog: true)),
                              child: Container(
                                  width: 45,
                                  height: 45,
                                  child: CircleAvatar(
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.1),
                                      backgroundImage:
                                          ExactAssetImage(profileImage))))),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(value![index].playerName!,
                                        style: TextStyle(fontSize: 14)),
                                    Container(
                                        padding: EdgeInsets.only(top: 1),
                                        child: Text('SA - WK',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54)))
                                  ]))),
                      Container(
                          width: 70,
                          child: Center(
                              child: Text('00',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54)))),
                      SizedBox(width: 5),
                      Container(
                          width: 25,
                          height: 25,
                          child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(30.0),
                                  border: new Border.all(
                                      width: 1.0,
                                      color: value![index].role == 'Captain'
                                          ? Colors.blue
                                          : Colors.black54)),
                              child: Center(
                                  child: Text('C',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: value![index].role == 'Captain'
                                              ? Colors.blue
                                              : Colors.black54))))),
                      SizedBox(width: 20),
                      Container(
                          width: 25,
                          height: 25,
                          child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(30.0),
                                  border: new Border.all(
                                      width: 1.0, color: value![index].role == 'Vice Captain'
                                      ? Colors.blue
                                      : Colors.black54)),
                              child: Center(
                                  child: Text('VC',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: value![index].role == 'Vice Captain'
                                              ? Colors.blue
                                              : Colors.black54)))))
                    ]),
                  ),
                  SizedBox(height: 0.3),
                  Divider(height: 1, color: Colors.black12, thickness: 0.3)
                ]));
          },
          itemCount: value!.length,
        ),
      ],
    );
  }
}

class Players {
  String? name;
  String? playingRole;

  Players({this.name, this.playingRole});
}
