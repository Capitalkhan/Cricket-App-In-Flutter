import 'package:flutter/material.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          "Target : ${teams.target}".text.xl.make(),
          "Total    : ${teams.info['total']}".text.xl.make(),
          if(teams.info['total'] != teams.target)
          teams.info['total'] < teams.target && teams.info['bat'] % 2 == 0
              ? "${teams.info['team1']} Won the Match".text.xl4.make().centered()
              : "${teams.info['team2']} Won the Match".text.xl4.make().centered(),
         if(teams.info['total'] == teams.target)
          "match tied".text.xl.make(),

        ],
      ),
    );
  }
}
