import 'package:cricketfantasy/screen/page/create_team.dart';
import 'package:cricketfantasy/screen/page/playerprofile.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CreateTeamSelectionWidget extends StatefulWidget {
  final String? title;
  List<Player>? list;
  Function(dynamic)? onChangeValue;
  Function(dynamic, dynamic)? onTap;
  bool? isSelected;
  CreateTeamSelectionWidget({Key? key, this.title, this.onChangeValue, this.list, this.onTap, this.isSelected})
      : super(key: key);
  @override
  createState() => _CreateTeamSelectionState();
}

class _CreateTeamSelectionState extends State<CreateTeamSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          width: double.infinity,
          height: 40,
          color: HexColor('#F5F5F5'),
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
          child: Center(
              child: Text(widget.title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)))),
      Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('PLAYERS', style: TextStyle(fontSize: 12)),
                          ]))),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                        width: 50,
                        child: Center(
                            child: Text('POINTS',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54)))),
                    SizedBox(width: 5),
                    Container(
                        width: 70,
                        child: Center(
                            child: Row(children: <Widget>[
                              Text('CREDIT',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54)),
                              Icon(LineIcons.arrowDown, size: 20)
                            ]))),
                  ],
                ),
              ),
              SizedBox(
                width: 40,
              ),
            ])),
        Divider(height: 1)
      ]),
      Flexible(
          child: ListView.builder(
              itemCount: widget.list!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                  EdgeInsets.only(top: 0, bottom: 1, left: 10, right: 10),
                  child: widget.list![index].playerName!.isEmpty
                      ? Container()
                      :  Card(
                      elevation: 5,
                      child: Column(children: <Widget>[
                        Container(
                            color: HexColor('#F5F5F5'),
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
                                              backgroundColor: Colors.grey
                                                  .withOpacity(0.1),
                                              backgroundImage:
                                              ExactAssetImage(
                                                  profileImage))))),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(widget.list![index].playerName!,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color:Colors.black
                                                )),
                                            Container(
                                                padding:
                                                EdgeInsets.only(top: 1),
                                                child: Text("Sell by 70%",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors
                                                            .black54)))
                                          ]))),
                              Container(
                                  width: 60,
                                  child: Center(
                                      child: Text('00',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54)))),
                              SizedBox(width: 15),
                              Container(
                                  width: 50,
                                  child: Text('00',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black54))),
                              Container(
                                  width: 25,
                                  height: 25,
                                  child: GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        widget.list![index].role='Captain';
                                      });
                                    },
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                            borderRadius: new BorderRadius.circular(30.0),
                                            border: new Border.all(
                                                width: 1.0, color: widget.list![index].role=='Captain'?Colors.blue:Colors.black54)),
                                        child: Center(
                                            child: Text('C',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: widget.list![index].role=='Captain'?Colors.blue:Colors.black54)))),
                                  )),
                              SizedBox(width: 10),
                              Container(
                                  width: 25,
                                  height: 25,
                                  child: GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        widget.list![index].role='Vice Captain';
                                      });
                                    },
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                            borderRadius: new BorderRadius.circular(30.0),
                                            border: new Border.all(
                                                width: 1.0, color: widget.list![index].role=='Vice Captain'?Colors.blue:Colors.black54)),
                                        child: Center(
                                            child: Text('VC',
                                                style: TextStyle(
                                                    fontSize: 12, color: widget.list![index].role=='Vice Captain'?Colors.blue:Colors.black54)))),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    widget.onTap!(
                                        widget.list![index], index);
                                  },
                                  child:
                                  widget.list![index].isSelected! && widget.isSelected!
                                      ? Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                  )
                                      : Icon(Icons.add_circle_outlined,
                                      color: Colors.green),
                                ),
                              ),
                            ])),
                        SizedBox(height: 0.3),
                        Divider(
                            height: 1,
                            color: Colors.black12,
                            thickness: 0.3)
                      ])),
                );
              }))
    ]);
  }
}
