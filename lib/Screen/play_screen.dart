import 'dart:async';
import 'dart:math';

import 'package:add_drop_product/Screen/status.dart';
import 'package:add_drop_product/core/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../provider/team.dart';
import '../widget/play_card.dart';

class PlayScreen extends StatelessWidget {
  static final route = './play_screen';

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
          teams.info["bat"] % 2 == 0
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
          VxBuilder(
            mutations: {},
            builder: (context, dynamic, _) => Padding(
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
            ),
          )
        ],
      ),
    );
  }
}

class Winner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeamsModel teams = (VxState.store as MyStore).teams;
    return teams.info['total'] >= teams.target
        ? "${teams.info['team1']} Won the Match".text.make()
        : "${teams.info['team2']} Won the Match".text.make();
  }
}

class TargetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeamsModel teams = (VxState.store as MyStore).teams;
    return teams.target != 0
        ? "Target ${teams.target}".text.make()
        : "".text.make();
  }
}

class MatchTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeamsModel hittingBall = (VxState.store as MyStore).teams;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
            "Match Status : ${hittingBall.info["total"].toString()} / ${hittingBall.out}"),
        Text("overs ${hittingBall.over.toStringAsFixed(1)}")
      ],
    );
  }
}

class SecondInings extends StatelessWidget {
  const SecondInings({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamsModel status = (VxState.store as MyStore).teams;
    ResetMutation();
    print("indar");
    return GridTile(child: "Target ${status.info['total']}".text.make());
  }
}
