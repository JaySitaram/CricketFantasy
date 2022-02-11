import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/screen/page/team_preview.dart';
import 'package:cricketfantasy/screen/widget/create_team_progress_bar.dart';
import 'package:cricketfantasy/screen/widget/create_team_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'choose_c_vc.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({Key? key}) : super(key: key);
  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  CricketScheduleResponse? response;
  List<Player> wkList = [];
  List<Player> selectedBatsman = [];
  List<Player> selectedBowler = [];
  List<Player> selectedWK = [];
  List<Player> selectedAllRounder = [];
  List<Player> batsmanList = [];
  List<Player> bowlerList = [];
  List<Player> arList = [];
  Map<String, List<Player>> selectedTeam = {};
  int currentValue = 0;

  String text = 'Choose captain and vice captain';

  bool? isSelected = true;
  bool? isSelected1 = true;
  bool? isSelected2 = true;
  bool? isSelected3 = true;
  var captain, viceCaptain;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    for (var value in responseString) {
      if (selectedIdModel.id == value.competitionId) {
        setState(() {
          response = value;
        });
      }
    }
    checkResponse(rcbPlayers);
    checkResponse(kkrPlayers);
    checkResponse(cskPlayers);
    checkResponse(miPlayers);
    checkResponse(pbksPlayers);
    checkResponse(rrPlayers);
    checkResponse(dcPlayers);
    checkResponse(srhPlayers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 40,
          margin: EdgeInsets.all(10),
          child: Material(
              color: Colors.transparent,
              child: Row(children: [
                Expanded(
                  child: Container(
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(4.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 0),
                                blurRadius: 0.0)
                          ]),
                      child: InkWell(
                          borderRadius: new BorderRadius.circular(4.0),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => TeamPreviewScreen(
                                      team: selectedTeam,
                                    )));
                          },
                          child: Center(child: Text('TEAM PREVIEW')))),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Container(
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(4.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 0),
                            blurRadius: 0.0)
                      ]),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseCVCScreen(
                                    team: selectedTeam,
                                  ),
                              fullscreenDialog: true),
                      );
                    },
                    child: Center(child: Text("View Team List")),
                  ),
                ))
              ]))),
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            color: Colors.red,
            padding: EdgeInsets.all(15),
            child: Card(
                elevation: 0.5,
                margin: EdgeInsets.all(0),
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(4),
                      child: Column(children: <Widget>[
                        Text('Max 11 players from a team',
                            style: TextStyle(color: Colors.black54)),
                        SizedBox(height: 5),
                      ])),
                  Container(
                      padding: EdgeInsets.all(4),
                      child: Row(children: <Widget>[
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  child: Text('Players',
                                      style: TextStyle(color: Colors.black54))),
                              Row(children: <Widget>[
                                Text(currentValue.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                ),
                                Text(' / 11',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                )
                              ])
                            ]),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(response!.teamName1!,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.purple)),
                            SizedBox(width: 5),
                            Container(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.1),
                                    backgroundImage:
                                        ExactAssetImage(response!.teamLogo1!))),
                            Container(
                                margin: EdgeInsets.only(left: 3, right: 3),
                                child: Text('vs',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.red))),
                            Container(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.1),
                                    backgroundImage:
                                        ExactAssetImage(response!.teamLogo2!))),
                            SizedBox(width: 5),
                            Text(response!.teamName2!,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.purple))
                          ],
                        )),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('Credits',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  )),
                              Text('00',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black))
                            ])
                      ])),
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text(text,
                          style: TextStyle(color: Colors.deepOrangeAccent))),
                  Container(
                      height: 40,
                      width: double.infinity,
                      padding: EdgeInsets.all(7),
                      child: CreateTeamProgressBarWidget(
                          teamCount: int.parse(currentValue.toString())))
                ])),
          ),
          Container(
              height: 40,
              child: TabBar(
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'WK'),
                  Tab(text: 'BAT'),
                  Tab(text: 'AR'),
                  Tab(text: 'BOWL')
                ],
                controller: tabController,
              )),
          Flexible(
              child: TabBarView(
                  physics: BouncingScrollPhysics(
                    parent: PageScrollPhysics(),
                  ),
                  controller: tabController,
                  children: <Widget>[
                wkList.isNotEmpty
                    ? CreateTeamSelectionWidget(
                        title: 'Pick 1 Wicket - Keeper',
                        list: wkList,
                        onTap: (value, value1) {
                          previewMethod("WK", 1, wkList, selectedWK, value,
                              value1, "Max WK Allowed would be 1");
                        },
                        isSelected: isSelected,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                batsmanList.isNotEmpty
                    ? CreateTeamSelectionWidget(
                        title: 'Pick 4 Batsmens',
                        list: batsmanList,
                        onTap: (value, value1) {
                          previewMethod(
                              "Batsman",
                              4,
                              batsmanList,
                              selectedBatsman,
                              value,
                              value1,
                              "Max Allowed batsman are 4");
                        },
                        isSelected: isSelected1,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                arList.isNotEmpty
                    ? CreateTeamSelectionWidget(
                        title: 'Pick 2 All Rounders',
                        list: arList,
                        onTap: (value, value1) {
                          previewMethod(
                              "All Rounder",
                              2,
                              arList,
                              selectedAllRounder,
                              value,
                              value1,
                              "Please Select only 2 All Rounder");
                        },
                        isSelected: isSelected2,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                bowlerList.isNotEmpty
                    ? CreateTeamSelectionWidget(
                        title: 'Pick 4 Bowlers',
                        list: bowlerList,
                        onTap: (value, value1) {
                          previewMethod("Bowler", 4, bowlerList, selectedBowler,
                              value, value1, "Max Allowed bowlers are 4");
                        },
                        isSelected: isSelected3,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ]))
        ]),
      ),
    );
  }

  void checkResponse(Map playerContent) {
    if (playerContent[response!.teamName1] != null) {
      for (int i = 0; i < playerContent[response!.teamName1].length; i++) {
        loadPlayersContent(playerContent, response!.teamName1, i);
      }
    } else if (playerContent[response!.teamName2] != null) {
      for (int i = 0; i < playerContent[response!.teamName2].length; i++) {
        loadPlayersContent(playerContent, response!.teamName2, i);
      }
    }
  }

  loadPlayersContent(Map playerContent, String? myTeam, int i) {
    setState(() {
      wkList.add(Player(
          playerName: (playerContent[myTeam] as List)[i]['WK'] ?? "",
          isSelected: false,
          role: "Player"));
      batsmanList.add(Player(
          playerName: (playerContent[myTeam] as List)[i]['Batsman'] ?? "",
          isSelected: false,
          role: "Player"));
      bowlerList.add(Player(
          playerName: (playerContent[myTeam] as List)[i]['Bowler'] ?? "",
          isSelected: false,
          role: "Player"));
      arList.add(Player(
          playerName: (playerContent[myTeam] as List)[i]['All Rounder'] ?? "",
          isSelected: false,
          role: "Player"));
    });
  }

  void previewMethod(String s, int i, List<Player> currentList,
      List<Player> selectedValue, var myValue, var mV1, String s1) {
    setState(() {
      if (selectedValue.length >= i) {
        selectedValue.clear();
        selectedTeam.removeWhere((key, value) => key == s);
        setState(() {
          text = s1;
        });
        for (var mvalue in currentList) {
          mvalue.isSelected = false;
        }
      }
      currentList[mV1].isSelected = !currentList[mV1].isSelected!;
      if (currentList[mV1].isSelected!) {
        selectedValue.add(myValue);
      } else {
        selectedValue.remove(myValue);
      }
      selectedTeam.putIfAbsent(s, () => selectedValue);
      getCurrentValue();
    });
  }

  void getCurrentValue() {
    setState(() {
      currentValue = selectedWK.length +
          selectedBatsman.length +
          selectedBowler.length +
          selectedAllRounder.length;
    });
  }
}

class Player {
  String? playerName;
  bool? isSelected;
  String? role = 'Player';

  Player({this.playerName, this.isSelected, this.role});
}
