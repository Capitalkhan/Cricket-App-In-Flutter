import 'dart:async';
import 'dart:math';

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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
          child: Text("First Inning"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          teams.info["bat"] % 2 == 0
              ? "${teams.info['team1']} Batting".text.xl2.bold.make()
              : "${teams.info["team2"]} Batting".text.xl2.make(),
          SizedBox(height: 18,),
          VxBuilder(
            mutations: {
              AddTotalMutation,
              UpdateOutMutation,
              UpdateOverMutation
            },
            builder: (context, dynamic, _) => MatchTitleBar(),
          ),
          SizedBox(
            height: 15,
          ),
          VxBuilder(
            builder: (context, dynamic, _) => TargetWidget(),
            mutations: {ResetMutation},
          ),
          Padding(
            padding: EdgeInsets.all(13),
            child: GridView.builder(
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



class TargetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeamsModel teams = (VxState.store as MyStore).teams;
    return teams.target != 0
        ? "Target: ${teams.target}".text.xl2.make()
        : "First Inning".text.xl.make();
  }
}

class MatchTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeamsModel hittingBall = (VxState.store as MyStore).teams;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        "Match Status:  ${hittingBall.info["total"].toString()} / ${hittingBall.out}".text.xl.make(),
        "Overs: ${hittingBall.over.toStringAsFixed(1)}".text.xl.make()
      ],
    );
  }
}