import 'package:add_drop_product/Screen/play_screen.dart';
import 'package:add_drop_product/provider/team.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import './Screen/team_select_screen.dart';
import './Screen/toss_screen.dart';
import 'core/store.dart';
import 'provider/team.dart';
void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/': (ctx) => TeamSelection(),
        TossScreen.route: (ctx) => TossScreen(),
        PlayScreen.route: (ctx) => PlayScreen(),
      },
    );
  }
}
