import 'package:cricketfantasy/screen/page/withdraw.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletDetailScreen extends StatefulWidget {
  const WalletDetailScreen({Key? key}) : super(key: key);
  @override
  createState() => _WalletDetailState();
}

class _WalletDetailState extends State<WalletDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.all(0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          wallet('Total balance', '00'),
          wallet('Deposit', '00'),
          winning('Winning', '00'),
          wallet('Bouns', '00'),
          myTransactions()
        ]);
  }

  wallet(String title, String response) => Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child:
                          Text(title, style: TextStyle(color: Colors.black54))),
                  Container(child: Text(response))
                ])),
        Divider()
      ]);

  winning(String title, String response) => Column(children: <Widget>[
        Container(
            margin: EdgeInsets.all(3),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child:
                          Text(title, style: TextStyle(color: Colors.black54))),
                  Expanded(child: SizedBox()),
                  InkWell( borderRadius: new BorderRadius.circular(50.0),
                      onTap: () =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WithDrawScreen(),
                                  fullscreenDialog: true)),
                      child: Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(6),
                          decoration: new BoxDecoration(
                              color: Colors.green,
                              borderRadius: new BorderRadius.circular(50.0),
                              border:
                                  Border.all(color: Colors.green, width: 1)),
                          child: Text('WITHDRAW',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white)))),
                  Container(child: Text(response))
                ])),
        Divider()
      ]);

  myTransactions() => InkWell(
      onTap: () => Navigator.pushNamed(context, routeTransactionHistory),
      child: Container(color: Colors.black.withOpacity(0.1),
          height: 45,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(children: <Widget>[
            Expanded(
                child: Text("My Transactions",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Icon(Icons.keyboard_arrow_right)
          ])));
}
