import 'package:expense_app/Modals/money_model.dart';
import 'package:get/get.dart';

import '../Database/boxes.dart';

class StateController extends GetxController{
   RxString incomeCategory=''.obs;
   RxString incomeTime=''.obs;
   RxString expenseCategory=''.obs;
   RxString expenseTime=''.obs;
   var selectedValue = 1.obs;
   var selectedIncomeValue = 1.obs;
   RxString selectedTheme='System Default'.obs;

   void updateSelectedTheme(String value) {
      selectedTheme.value = value;
   }
   void updateSelectedValue(int value) {
      selectedValue.value = value;
   }
   void updateSelectedIncomeValue(int value) {
      selectedIncomeValue.value = value;
   }
   void submitData(MoneyModel record)async{
      final box = Boxes.getRecords();
      box.add(record);
      record.save();
   }

   void deleteData(MoneyModel record)async{
      record.delete();
   }

   void updateData(MoneyModel record)async{
      record.save();
   }
}