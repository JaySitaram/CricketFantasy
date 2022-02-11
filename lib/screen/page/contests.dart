import 'dart:core';
import 'package:cricketfantasy/model/contests_response.dart';
import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/screen/page/create_contest_own.dart';
import 'package:cricketfantasy/screen/widget/contests.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'contest_invite_code.dart';

class ContestsScreen extends StatefulWidget {
  const ContestsScreen({Key? key}) : super(key: key);
  @override
  createState() => _ContestsState();
}

class _ContestsState extends State<ContestsScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<ContestsResponse>? contestsList;
  CricketScheduleResponse? response;
  

  @override
  void initState() {
    contestsList = [];
    for(var value in responseString){
      if(selectedIdModel.id==value.competitionId){
        setState(() {
          response=value;
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ContestsLeague> contestsLeagueList = [];
    contestsLeagueList.add(ContestsLeague(
        contestsId: '1',
        entryFees: '500',
        totalTeam: '12',
        remainingTeam: '1',
        totalWinner: '10',
        createdTime: 0,
        updatedTime: '0',
        isDelete: false,
        isActive: true,
        isFull: false,
        isRefund: false,
        isResult: '',
        totalWiningAmount: '1000'));
    contestsLeagueList.add(ContestsLeague(
        contestsId: '1',
        entryFees: '500',
        totalTeam: '12',
        remainingTeam: '1',
        totalWinner: '10',
        createdTime: 0,
        updatedTime: '0',
        isDelete: false,
        isActive: true,
        isFull: false,
        isRefund: false,
        isResult: '',
        totalWiningAmount: '1000'));
    contestsLeagueList.add(ContestsLeague(
        contestsId: '1',
        entryFees: '500',
        totalTeam: '12',
        remainingTeam: '1',
        totalWinner: '10',
        createdTime: 0,
        updatedTime: '0',
        isDelete: false,
        isActive: true,
        isFull: false,
        isRefund: false,
        isResult: '',
        totalWiningAmount: '1000'));

    contestsList!.add(ContestsResponse(
      title: 'Header',
      description: 'Description',
      contestsLeagueList: contestsLeagueList,
    ));

    contestsList!.add(ContestsResponse(
      title: 'Header',
      description: 'Description',
      contestsLeagueList: contestsLeagueList,
    ));

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(elevation: 1, title: Text('Contests')),
        bottomNavigationBar: Container(
            height: 40,
            child: Container(
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(4.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 0),
                          blurRadius: 0.0)
                    ]),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: new BorderRadius.circular(4.0),
                        onTap: () => Navigator.pushNamed(context, routeCreateTeam),
                        child: Center(child: Text('CREATE TEAM')))))),
        body: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Container(
                    width: 24,
                    height: 24,
                    child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        backgroundImage: ExactAssetImage(response!.teamLogo1!))),
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(response!.teamName1!,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('vs', style: TextStyle(fontSize: 18, color: Colors.red)),
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(response!.teamName2!,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    width: 24,
                    height: 24,
                    child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        backgroundImage: ExactAssetImage(response!.teamLogo2!)))
              ])),
          Divider(height: 1),
          Container(
              height: 30,
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(4.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: Offset(0, 0.3))
                                ]),
                            child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    borderRadius:
                                        new BorderRadius.circular(4.0),
                                    onTap: () =>
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ContestInviteCodeScreen(),
                                              fullscreenDialog: true)),
                                    child: Container(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Center(
                                            child: Text('Enter Contest Code',
                                                style: TextStyle(
                                                    color: Colors.black)))))))),
                    SizedBox(width: 16),
                    Expanded(
                        child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(4.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: Offset(0, 0.3))
                                ]),
                            child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    borderRadius:
                                        new BorderRadius.circular(4.0),
                                    onTap: () =>
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => CreateContestOwnScreen(),
                                                fullscreenDialog: true)),
                                    child: Container(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Center(
                                            child: Text('Create a Contest',
                                                style: TextStyle(
                                                    color: Colors.black))))))))
                  ])),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: contestsList!.length,
                  itemBuilder: (context, index) {
                    return Material(
                        child: StickyHeader(
                            header: Container(
                                padding: EdgeInsets.all(5),
                                color: HexColor('#F5F5F5'),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(children: <Widget>[
                                        InkWell(
                                            child: Column(children: <Widget>[
                                          Text(contestsList![index].title!),
                                          SizedBox(height: 1),
                                          Text(contestsList![index].description!,
                                              style: TextStyle(
                                                  color: Colors.black54))
                                        ]))
                                      ])
                                    ])),
                            content: Column(
                                children: getContestsSubList(
                                    contestsList![index].contestsLeagueList!))));
                  }))
        ]));
  }
}

List<Widget> getContestsSubList(List<ContestsLeague> contestsLeagueList) {
  var widgetList = <Widget>[];

  contestsLeagueList.forEach((listData) {
    widgetList.add(ContestsWidget());
  });

  return widgetList;
}
