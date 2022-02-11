import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/util/utils.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import '../../widget/team_play.dart';

class FixturesScreen extends StatelessWidget {
  const FixturesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: responseString.length,
            itemBuilder: (context, index) {
              return TeamPlayWidget(
                cricketModel: responseString[index],
                  countryImageA: profileImage,
                  countryImageB: profileImage,
                  times: Utils().getHours(responseString[index]),
                  contestJoinShow: true,
                  totalContestJoin: '3');
            }));
  }
}
