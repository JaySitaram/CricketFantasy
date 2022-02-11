import 'package:cricketfantasy/model/user.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'history_detail.dart';
import 'home.dart';
import 'my_profile_detail.dart';
import 'wallet_detail.dart';
import 'package:cricketfantasy/util/extensions.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfileScreen>
    with SingleTickerProviderStateMixin {
  double _appBarHeight = 100.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
  TabController? controller;
  ScrollController _scrollController = new ScrollController();
  var box;

  User? user;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
    getEmployees();
  }

  void getEmployees() {
    box = Hive.box<User>('myBox');
    setState(() {
      print(box.values);
      user=(box.values.toList())[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
       NestedScrollView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              widget.sliverAppBar(_appBarBehavior, [], widget.flexibleSpaceBar(user!.name!)),
              SliverPersistentHeader(
                  pinned: true, delegate: PersistentHeader(controller!))
            ];
          },
          body: Container(child: TabBarView(
              controller: controller,
              children: <Widget>[MyProfileDetailScreen(), HistoryDetailScreen(), WalletDetailScreen()])))
    ]));
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final TabController controller;

  PersistentHeader(
    this.controller,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(children: <Widget>[
      Container(
          color: Colors.white,
          height: 40,
          child: new TabBar(
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                new Tab(text: 'My Profile'),
                new Tab(text: 'History'),
                new Tab(text: 'Wallet')
              ],
              controller: controller)),
      Divider(height: 1)
    ]);
  }

  @override
  double get maxExtent => 41.0;

  @override
  double get minExtent => 41.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
