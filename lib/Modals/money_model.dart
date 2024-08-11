

import 'package:hive/hive.dart';
part 'money_model.g.dart';
@HiveType(typeId: 0)
class MoneyModel extends HiveObject{
  @HiveField(0)
  String category;
  @HiveField(1)
  String detail;
  @HiveField(2)
  int amount;
  @HiveField(3)
  bool amountType;
  @HiveField(4)
  String date;

  MoneyModel({
    required this.category,
    required this.detail,
    required this.amount,
    required this.amountType,
    required this.date,
  });
}



// flutter packages pub run build_runner build