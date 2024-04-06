import 'package:add_drop_product/Screen/play_screen.dart';
import 'package:add_drop_product/provider/team.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screen/team_select_screen.dart';
import './Screen/toss_screen.dart';
import 'provider/team.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (ctx) => Teams()),
      ],
      child: MaterialApp(

        routes: {
          '/': (ctx) => TeamSelection(),
          TossScreen.route: (ctx) => TossScreen(),
          PlayScreen.route: (ctx) => PlayScreen(),
        },
      ),
    );
  }
}
