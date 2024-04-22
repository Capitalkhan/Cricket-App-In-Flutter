import 'package:add_drop_product/Screen/team_select_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  SingleChildScrollView(child: DisplaySummary(teams.team1Summary, teams.info['team1'])),
                  SingleChildScrollView(child: DisplaySummary(teams.team1Summary, teams.info['team1'])),
                ],
              ),
              
              if (teams.info['total'] != teams.target)
                teams.info['total'] < teams.target && teams.info['bat'] % 2 == 0
                    ? "${teams.info['team1']} Won the Match"
                        .text
                        .xl4
                        .make()
                        .centered()
                    : "${teams.info['team2']} Won the Match"
                        .text
                        .xl4
                        .make()
                        .centered(),
              if (teams.info['total'] == teams.target)
                "match tied".text.xl.make().centered(),
            ],
          ),
        ));
  }
}

class DisplaySummary extends StatelessWidget {
  String team;
  List<String> list;
  DisplaySummary(this.list, this.team);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemBuilder: (ctx, index) {
            return "{$list[index]}".text.make();
          },
          itemCount: list.length,
        ),
      ],
    );
  }
}
