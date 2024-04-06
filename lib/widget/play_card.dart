import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/team.dart';

class PlayCard extends StatefulWidget {
  final String perBall;
  PlayCard(this.perBall);

  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {
  void setMethod() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Provider.of<Teams>(context, listen: false).updateBallingToZero();
    });
  }

  @override
  Widget build(BuildContext context) {
    final balling = Provider.of<Teams>(context, listen: false).ballingTracker;

    // setMethod();
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Card(
        color: Colors.cyanAccent,
        elevation: 15,
        child: Center(
          child: balling[widget.perBall] != 0 &&
                  balling[widget.perBall] != "" &&
                  widget.perBall != ""
              ? Text(
                  balling[widget.perBall].toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              : Text(""),
        ),
      ),
    );
  }
}
