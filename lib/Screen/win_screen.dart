import 'package:add_drop_product/Screen/team_select_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../provider/team.dart';

class WinScreen extends StatelessWidget {
  static final route = "./winScreen";
  const WinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamsModel teams = (VxState.store as MyStore).teams;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: "Match Summary".text.make().centered(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (teams.info['total'] != teams.target)
              teams.info['total'] < teams.target && teams.info['bat'] % 2 == 0
                  ? "${teams.info['team1']} Won the Match".text.xl3.bold.color(Colors.greenAccent).make().centered()
                  : "${teams.info['team2']} Won the Match".text.xl3.bold.color(Colors.greenAccent).make().centered(),
            if (teams.info['total'] == teams.target)
              "match tied".text.xl.make().centered(),
            SizedBox(
              height: 50,
            ),
            "Ball By Ball Summary".text.xl.bold.make(),
            Row(
              children: [
                DisplaySummary(
                    teams.info['bat'] % 2 == 0
                        ? teams.team1Summary
                        : teams.team2Summary,
                    teams.info['team1'],
                    teams.info['bat'] % 2 == 0
                        ? teams.target.toString()
                        : teams.info['total'].toString()),
                DisplaySummary(
                    teams.info['bat'] % 2 == 1
                        ? teams.team1Summary
                        : teams.team2Summary,
                    teams.info['team2'],
                    teams.info['bat'] % 2 == 0
                        ? teams.info['total'].toString()
                        : teams.target.toString()),
              ],
            ),
          ],
        ));
  }
}

class DisplaySummary extends StatelessWidget {
  String team;
  List<String> list;
  String total;
  DisplaySummary(this.list, this.team, this.total);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Divider(),
          "$team".text.xl2.bold.make(),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Card(
              elevation: 5,
              child: Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    shape: BoxShape.rectangle),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return "${list[index]}".text.xl.color(Colors.white).make().centered();
                  },
                  itemCount: list.length,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          "Total Runs: $total".text.xl2.bold.make(),
          Divider(),
        ],
      ),
    );
  }
}
