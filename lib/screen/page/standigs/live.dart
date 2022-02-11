import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/util/utils.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../widget/team_play.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  String? times;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: <Widget>[
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: responseString.length,
            itemBuilder: (context, index) {
              times=Utils().getHours(responseString[index]);
              return times=='00:00:00'?TeamPlayWidget(
                  cricketModel: responseString[index],
                  countryImageA: profileImage,
                  times: times,
                  countryImageB: profileImage,
                  contestJoinShow: true,
                  totalContestJoin: '3'):Container();
            })
      ]),
    ));
  }
}
