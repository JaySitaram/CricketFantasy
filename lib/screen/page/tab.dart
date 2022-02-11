import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cricketfantasy/screen/widget/drawer.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share/share.dart';

import 'home.dart';
import 'more.dart';
import 'my_profile.dart';
import 'standings.dart';

class TabScreen extends StatefulWidget {
  @override
  createState() => _TabState();
}

class _TabState extends State<TabScreen> with SingleTickerProviderStateMixin {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget tabBody = Container();
  int currentIndex = 0;

  void initState() {
    super.initState();
    tabBody = HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: DrawerWidget(
                myProfile: () {
                  setState(() {
                    currentIndex = 2;
                    tabBody = MyProfileScreen();
                  });
                },
                myReferrals: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => myReferrals('200')))),
        bottomNavigationBar: bottomNavyBar(),
        body: tabBody);
  }

  myReferrals(String referral) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
          padding: EdgeInsets.all(5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Kick off your friend's Fixturers journey!",
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 3),
                Text("For every friend that plays, you both get 100 for free!",
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.center)
              ])),
      Divider(height: 1),
      Container(
          padding: EdgeInsets.all(8),
          child: Text('SHARE YOUR INVITE CODE',
              style: TextStyle(color: Colors.blue))),
      Container(
          padding: EdgeInsets.all(5),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Text("How it works"))),
                Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                        height: 24,
                        width: 1,
                        color: Colors.grey.withOpacity(0.5))),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Text("Rules of FairPlay")))
              ])),
      Container(
          padding: EdgeInsets.all(16),
          child: Text(referral, style: TextStyle(fontSize: 28))),
      InkWell(
          onTap: () {
            Navigator.pop(context);
            Share.share(
                "Think you can challenge me on Fixturers?\nuse my invite code $referral to get a Cash Bouns of Rs.100! Let the games begin.");
          },
          child: Container(
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.black, width: 1),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 0),
                        blurRadius: 0.0)
                  ]),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Share Code'.toUpperCase(),
                  )))),
      SizedBox(height: 10)
    ]);
  }

  _tabScreenList() {
    print("$currentIndex");
    if (currentIndex == 0) {

      return HomeScreen(menuCallBack: () {
        _scaffoldKey.currentState!.openEndDrawer();
      });
    } else if (currentIndex == 1) {
      return StandingsScreen(menuCallBack: () {
        _scaffoldKey.currentState!.openEndDrawer();
      });
    } else if (currentIndex == 2) {
      return MyProfileScreen();
    } else if (currentIndex == 3) {
      return MoreScreen(inviteFriendClick: () {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) => myReferrals('200'));
      });
    }
  }

  bottomNavyBar() {
    return BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) => setState(() {
              currentIndex = index;
              tabBody = _tabScreenList();
            }),
        items: [
          BottomNavyBarItem(
              icon: Icon(LineIcons.home, size: 25),
              title: Text(' Home'),
              inactiveColor: HexColor(colorBottomNavyBarInactive)),
          BottomNavyBarItem(
              icon: Icon(LineIcons.trophy, size: 25),
              title: Text(' Matches'),
              inactiveColor: HexColor(colorBottomNavyBarInactive)),
          BottomNavyBarItem(
              icon: Icon(LineIcons.user, size: 25),
              title: Text(' Me'),
              inactiveColor: HexColor(colorBottomNavyBarInactive)),
          BottomNavyBarItem(
              icon: Icon(LineIcons.cog, size: 25),
              title: Text(' More'),
              inactiveColor: HexColor(colorBottomNavyBarInactive))
        ]);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
