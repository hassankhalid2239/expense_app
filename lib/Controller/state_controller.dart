import 'package:expense_app/Modals/money_model.dart';
import 'package:get/get.dart';

import '../Database/boxes.dart';

class StateController extends GetxController{
   RxString incomeCategory=''.obs;
   RxString incomeTime=''.obs;
   RxString expenseCategory=''.obs;
   RxString expenseTime=''.obs;

   void submitData(MoneyModel record)async{
      final box = Boxes.getRecords();
      box.add(record);
      record.save();
   }

}


/*
   void selectIncomeCategory(String selectedValue){
     incomeCategory.value=selectedValue;
   }
   void getIncomeTime(String selectedValue){
     incomeTime.value=selectedValue;
   }
 */