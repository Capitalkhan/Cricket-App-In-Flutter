import 'package:add_drop_product/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class TeamsModel {
  // final List teams = [];
  double over = 0;
  int out = 0;
  int target = 0;
  bool flag = true;

  Map<String, dynamic> info = {
    "over": 0.0,
    "team1": "",
    "team2": "",
    "bat": 0,
    "total": 0,
  };
// Map<String, dynamic> ballingTracker = {
//    "1" : 0,
//    "2" : 0,
//    "3" : 0,
//    "4" : 0,
//    "6" : 0,
//    "wide" : "",
//    "noBall" : "",
//    "bit" : "",
  // };

  bool winnerChoser() {
    if (target != 0 && (info['total'] > target || info['over'] == over)) {
      return true;
    }
    return false;
  }
}

class UpdateMutation extends VxMutation<MyStore> {
  final String key;
  final dynamic val;

  UpdateMutation(this.key, this.val);

  @override
  perform() {
    store?.teams.info.update(key, (value) => value = val);
  }
}

class AddTotalMutation extends VxMutation<MyStore> {
  final int num;
  AddTotalMutation(this.num);

  @override
  perform() {
    int total = store?.teams.info['total'];

    store?.teams.info.update("total", (value) => value = total + num);
  }
}

class UpdateOverMutation extends VxMutation<MyStore> {
  final double x;

  UpdateOverMutation(this.x);
  @override
  perform() {
    if (store?.teams.over == 0.6) {
      store?.teams.over = 1;
    }
    store?.teams.over += x;
    if (store?.teams.target == 0) {
      if (store?.teams.info['over'].toString() == store?.teams.over.toStringAsFixed(1)) {
        store?.teams.target = store?.teams.info['total'];
        ResetMutation();
      }
    }
  }
}

class ChoseWinner extends VxMutation<MyStore> {
  @override
  perform() {
    if (store?.teams.info['total'] > store?.teams.target ||
        store?.teams.info['over'] == store?.teams.over) {
      return true;
    }
    return false;
  }
}

class UpdateOutMutation extends VxMutation<MyStore> {
  final int x;

  UpdateOutMutation(this.x);
  @override
  perform() {
    store?.teams.out += x;
  }
}

class JustUpdateMutation extends VxMutation<MyStore> {
  @override
  perform() {}
}

class ResetMutation extends VxMutation<MyStore> {
  @override
  perform() {
    store?.teams.info['total'] = 0;
    store?.teams.over = 0;
    store?.teams.out = 0;
    store?.teams.flag = false;
  }
}
