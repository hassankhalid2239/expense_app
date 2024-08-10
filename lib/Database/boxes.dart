import 'package:hive/hive.dart';

import '../Modals/money_model.dart';

class Boxes{

  static Box<MoneyModel> getRecords()=>Hive.box<MoneyModel>('Records');
}