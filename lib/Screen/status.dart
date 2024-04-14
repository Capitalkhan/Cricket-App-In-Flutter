import 'package:add_drop_product/core/store.dart';
import 'package:add_drop_product/provider/team.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StatusGame extends StatelessWidget {
  static final route = "./GameStatus";
  const StatusGame({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamsModel status = (VxState.store as MyStore).teams;
    return Scaffold(
      appBar: AppBar(
          title: "Status".text.xl.make(),
      ),
      body:"halo bro".text.make().centered(),
    );
  }
}
