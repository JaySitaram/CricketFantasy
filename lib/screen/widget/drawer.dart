import 'package:cricketfantasy/model/user.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icons.dart';
import 'package:cricketfantasy/util/extensions.dart';

class DrawerWidget extends StatefulWidget {
  final VoidCallback? myReferrals;
  final VoidCallback? myProfile;

  const DrawerWidget({Key? key, this.myReferrals, this.myProfile})
      : super(key: key);
  @override
  createState() => _DrawerState();
}

class _DrawerState extends State<DrawerWidget> {
  var box;
  User? user;
  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  void getEmployees() {
    box = Hive.box<User>('myBox');
    setState(() {
      user=(box.values.toList())[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: Column(children: <Widget>[
          Column(children: <Widget>[userDetail()]),
          Flexible(
              child: ListView(children: <Widget>[
            Divider(height: 1),
            Column(children: <Widget>[
              widget.drawerMenu(
                  icon: LineIcons.toggleOn,
                  title: 'Notification',
                  qrCallback: () {
                    Navigator.pop(context);
                  }),
              Divider(height: 1),
              widget.drawerMenu(
                  icon: LineIcons.user,
                  title: 'My Profile',
                  qrCallback: () {
                    Navigator.pop(context);
                    widget.myProfile!();
                  }),
              Divider(height: 1),
              myBalance(),
              Divider(height: 1),
              widget.drawerMenu(
                  icon: LineIcons.user,
                  title: 'My Referrals',
                  qrCallback: () {
                    Navigator.pop(context);
                    widget.myReferrals!();
                  }),
              Divider(height: 1),
              widget.drawerMenu(
                  icon: LineIcons.cog,
                  title: 'My Info & Settings',
                  qrCallback: () {
                    Navigator.pop(context);
                  }),
              Divider(height: 1),
              widget.drawerMenu(
                  icon: LineIcons.database,
                  title: 'Point System',
                  qrCallback: () {
                    Navigator.pop(context);
                  }),
              Divider(height: 1),
              Divider(height: 1),
              widget.drawerMenu(
                  icon: LineIcons.lock,
                  title: 'Logout',
                  qrCallback: () {
                    Navigator.pop(context);
                  }),
              Divider(height: 1)
            ])
          ])),
          Padding(padding: EdgeInsets.all(4), child: Text('version 1.0'))
        ]));
  }

  userDetail() => Container(
      margin: EdgeInsets.only(top: 30, right: 10),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(children: <Widget>[
              Text(user!.name!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16)),
              Row(children: <Widget>[
                Icon(Icons.location_on, size: 18, color: Colors.black45),
                Text(user!.state!=null?user!.state!:'',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14))
              ])
            ]),
            SizedBox(width: 10),
            Container(
                width: 40.0,
                height: 40.0,
                child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    backgroundImage: ExactAssetImage(profileImage)))
          ]));

  myBalance() => InkWell(
      onTap: () => Navigator.pop(context),
      child: Padding(
          padding: EdgeInsets.all(14),
          child: Row(children: <Widget>[
            Icon(LineIcons.moneyCheck, size: 22),
            SizedBox(width: 30),
            Text('My Balance'),
            SizedBox(width: 30),
            InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.blue, width: 1)),
                    child: Center(
                        child: Text('ADD CASH'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)))))
          ])));
}
