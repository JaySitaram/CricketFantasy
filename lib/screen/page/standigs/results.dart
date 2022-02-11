import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/util/utils.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import '../../widget/team_play.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({
    Key? key,
  }) : super(key: key);

  String? times;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: responseString.length,
            itemBuilder: (context, index) {
              times=Utils().getHours(responseString[index]);
              return times=="00:00:00"?TeamPlayWidget(
                cricketModel: responseString[index],
                  countryImageA: profileImage,
                  countryImageB: profileImage,
                  times: times,
                  contestJoinShow: true,
                  totalContestJoin: '3'):Container();
            }));
  }
}
