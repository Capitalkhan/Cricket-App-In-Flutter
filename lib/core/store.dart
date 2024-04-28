import 'package:velocity_x/velocity_x.dart';

import '../provider/team.dart';
import '../provider/team_selector.dart';

class MyStore extends VxStore {
  late TeamsModel teams;
  late TeamSelector teamSelector;
  MyStore() {
    teams = TeamsModel();
    teamSelector = TeamSelector();
  }

}