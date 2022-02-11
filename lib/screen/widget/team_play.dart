import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/screen/widget/match_detail.dart';
import 'package:cricketfantasy/util/utils.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'matchtimer.dart';

class TeamPlayWidget extends StatefulWidget {
  final String? countryImageA, countryImageB, totalContestJoin;

  CricketScheduleResponse? cricketModel;

  final bool contestJoinShow;
  var times;

  TeamPlayWidget(
      {Key? key,
      this.cricketModel,
      this.countryImageA,
      this.countryImageB,
      this.times,
      this.totalContestJoin,
      this.contestJoinShow = false})
      : super(key: key);

  @override
  createState() => _TeamPlayState();
}

class _TeamPlayState extends State<TeamPlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () {
              setState(() {
                if(widget.times!='00:00:00'){
                  selectedIdModel.id = widget.cricketModel!.competitionId!;
                  Navigator.pushNamed(context, routeContests);
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("This match is completed"),
                  ));
                }

              });

            },
            onLongPress: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) => MatchDetailWidget(
                    cricketModel:widget.cricketModel,
                        // team1: widget.cricketModel!.teamName1,
                        // team2: widget.cricketModel!.teamName2,
                      ));
            },
            child: Column(children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle)),
                        Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(widget.cricketModel!.match!))
                      ])),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage: ExactAssetImage(
                                widget.cricketModel!.teamLogo1!))),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Text(widget.cricketModel!.seriesName!,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54)),
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text(
                                                widget.cricketModel!.teamName1!,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)))),
                                    Text('vs',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.red)),
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(right: 8),
                                            child: Text(
                                                widget.cricketModel!.teamName2!,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.end)))
                                  ])),
                          MatchTimerWidget(
                              dateStart: DateFormat("yyyy-MM-dd")
                                  .format(DateTime.now()),
                              timerStart: widget.times!)
                        ])),
                    Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage: ExactAssetImage(
                                widget.cricketModel!.teamLogo2!)))
                  ])),
              widget.contestJoinShow
                  ? Container(
                      padding:
                          const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                      child: Row(children: <Widget>[
                        Text(widget.totalContestJoin!,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 3),
                        Text('Contest joined',
                            style: TextStyle(color: Colors.blueGrey))
                      ]))
                  : Container()
            ])));
  }
}
