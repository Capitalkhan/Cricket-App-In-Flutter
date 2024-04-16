import 'package:add_drop_product/Screen/play_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../provider/team.dart';
import '../widget/play_card.dart';

class ChasingTeam extends StatelessWidget {
  static final route = "./ChasingTeam";
  const ChasingTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamsModel teams = (VxState.store as MyStore).teams;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Play"),
        ),
      ),
      body: Column(
        children: <Widget>[
          teams.info["bat"] % 2 == 1
              ? Text("${teams.info['team1']} Batting")
              : Text("${teams.info["team2"]} Batting"),
          VxBuilder(
            mutations: {
              AddTotalMutation,
              UpdateOutMutation,
              UpdateOverMutation
            },
            builder: (context, dynamic, _) => MatchTitleBar(),
          ),
          SizedBox(
            height: 20,
          ),
          VxBuilder(
            builder: (context, dynamic, _) => TargetWidget(),
            mutations: {ResetMutation},
          ),
          Padding(
            padding: EdgeInsets.all(13),
            child: teams.winnerChoser()
                ? Winner()
                : GridView.builder(
              itemCount: 8,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 7,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return PlayCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
