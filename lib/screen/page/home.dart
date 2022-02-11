import 'dart:ui';
import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/screen/widget/team_play.dart';
import 'package:cricketfantasy/util/utils.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cricketfantasy/util/extensions.dart';

class HomeScreen extends StatefulWidget {
  void Function()? menuCallBack;

  HomeScreen({Key? key, this.menuCallBack}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoginProgress = false;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: _scaffoldKey,
          body: RefreshIndicator(
              displacement: 100,
              key: _refreshIndicatorKey,
              onRefresh: () async {},
              child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    widget.sliverAppBar(
                        _appBarBehavior,
                        widget.menuCallBack != null
                            ? [widget.drawerIcon(widget.menuCallBack!)]
                            : [],
                        widget.flexibleSpaceBar(appName)),
                    SliverList(
                        delegate: new SliverChildBuilderDelegate(
                            (context, index) => TeamPlayWidget(
                                cricketModel: responseString[index],
                                countryImageA: profileImage,
                                countryImageB: profileImage,
                                contestJoinShow: true,
                                times: Utils().getHours(responseString[index]),
                                totalContestJoin: '3'),
                            childCount: responseString.length))
                  ])));
  }
}

enum AppBarBehavior { normal, pinned, floating, snapping }
