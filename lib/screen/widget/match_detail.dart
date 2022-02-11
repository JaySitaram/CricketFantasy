import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';

class MatchDetailWidget extends StatefulWidget {
  CricketScheduleResponse? cricketModel;
  MatchDetailWidget({Key? key,this.cricketModel}) : super(key: key);
  @override
  createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetailWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      matchVs(widget.cricketModel!.teamName1,widget.cricketModel!.teamName2),
      Divider(height: 1),
      Expanded(child: matchInfoList())
    ]));
  }

  matchInfoList() =>
      ListView(physics: BouncingScrollPhysics(), children: <Widget>[
        matchInfo('Match', '${widget.cricketModel!.teamName1}Vs${widget.cricketModel!.teamName2}'),
        matchInfo('Series', '${widget.cricketModel!.seriesName}'),
        matchInfo('Start Date', '${widget.cricketModel!.dateStart}'),
        matchInfo('Start Time', '${widget.cricketModel!.timeStart}'),
        matchInfo('Venue', '${widget.cricketModel!.venue}'),
        matchInfo('Umpires', '${widget.cricketModel!.umpires}'),
        matchInfo('Referee', '${widget.cricketModel!.referee}'),
        matchInfo('Match Format', '${widget.cricketModel!.matchFormat}'),
        matchInfo('Location', '${widget.cricketModel!.location}')
      ]);
}

matchInfo(String title, String description) => Column(children: <Widget>[
      Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title, style: TextStyle(color: Colors.black54)),
                SizedBox(width: 20),
                Flexible(child: Text(description))
              ])),
      Divider()
    ]);

matchVs(var team1,var team2) => Container(
    padding: EdgeInsets.all(10),
    height: 60,
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 30,
              height: 30,
              child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  backgroundImage: ExactAssetImage(profileImage))),
          Container(
              margin: EdgeInsets.only(left: 4),
              child: new Text(team1,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 10),
          Text('vs', style: TextStyle(fontSize: 18, color: Colors.red)),
          SizedBox(width: 10),
          Container(
              child: new Text(team2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Container(
              margin: EdgeInsets.only(left: 4),
              width: 30,
              height: 30,
              child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  backgroundImage: ExactAssetImage(profileImage))),
          Expanded(child: Container()),
          Text('Time')
        ]));
