import 'package:add_drop_product/provider/team.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late TeamsModel teams;

  MyStore() {
    teams = TeamsModel();
  }

}