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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
          child: Text("Second Inning"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          teams.info["bat"] % 2 == 1
              ? "${teams.info['team1']} Batting".text.xl2.bold.make()
              : "${teams.info["team2"]} Batting".text.xl2.bold.make(),
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
