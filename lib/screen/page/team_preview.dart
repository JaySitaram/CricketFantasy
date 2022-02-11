import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'create_team.dart';
import 'playerprofile.dart';

enum CreateTeamPreviewType { regular, created }

class TeamPreviewScreen extends StatefulWidget {
  Map<String,List<Player>>? team;
  TeamPreviewScreen({Key? key,this.team}) : super(key: key);
  @override
  createState() => _TeamPreviewState();
}

class _TeamPreviewState extends State<TeamPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Opacity(
                  opacity: 0.8,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                          'assets/images/cricket_ground.png',
                          fit: BoxFit.cover))),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 1),
                    Column(children: <Widget>[
                      matchHeader('WICKET - KEEPER'),
                      getTypeList(widget.team!['WK']!)
                    ]),
                    Column(children: <Widget>[
                      matchHeader('BATSMEN'),
                      widget.team!['Batsman']!=null?getTypeList(widget.team!['Batsman']!):Container()
                    ]),
                    Column(children: <Widget>[
                      matchHeader('ALL-ROUNDERS'),
                      widget.team!['All Rounder']!=null?getTypeList(widget.team!['All Rounder']!):Container(),
                    ]),
                    Column(children: <Widget>[
                      matchHeader('BOWLERS'),
                      widget.team!['Bowler']!=null?getTypeList(widget.team!['Bowler']!):Container()
                    ]),
                    SizedBox(height: 8)
                  ]),

            ]));
  }

  matchHeader(String title) =>  Container(
      padding: EdgeInsets.only(bottom: 8, top: 4),
      child: Text(title,
          style: TextStyle(color: Colors.black)));

  Widget getTypeList(List<Player> list) {
    List<Widget> widgetList = <Widget>[];
    list.forEach((data) {
      if(data.role!=null){
        widgetList.add(getPlayerView(data.playerName!,data.role!));
      }

    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: widgetList,
    );
  }

  Widget getPlayerView(String player,String value) {
    return Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width > 360 ? 8 : 4),
              right: (MediaQuery.of(context).size.width > 360 ? 8 : 4)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell( borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerProfileScreen(),
                            fullscreenDialog: true)),
                    child: Container(
                        width:
                            (MediaQuery.of(context).size.width > 360 ? 45 : 40),
                        height:
                            (MediaQuery.of(context).size.width > 360 ? 45 : 40),
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage: ExactAssetImage(profileImage)))),
                Container(
                    padding:
                        EdgeInsets.only(left: 6, top: 2, bottom: 2, right: 6),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.white)
                        ]),
                    child: Center(
                        child: Text(player,
                            style: TextStyle(color: Colors.blue)))),
                Container(
                    padding: EdgeInsets.all(4),
                    child: Center(
                        child: Text('10 Cr',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))))
              ])),
      Positioned(
          top: 0,
          left: 0,
          child: Container(
                  width: 27,
                  height: 27,
                  decoration: value!='Player'?BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: new BorderRadius.circular(32.0),
                      border: new Border.all(width: 1.0, color: Colors.black26)):null,
                  padding: EdgeInsets.only(bottom: 2),
                  child: Center(child:getTitle(value))))
    ]);
  }

  Widget getTitle(var value){
    if(value=='Captain'){
      return Text("C");
    }
    else if(value=='Vice Captain'){
      return Text("VC");
    }
    return Text("");
  }
}

