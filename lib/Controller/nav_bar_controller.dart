import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class NavBarController extends GetxController{
  RxInt getPageIndex = 0.obs;

  WhenPageChanges(int pageIndex) {
      getPageIndex.value = pageIndex;
  }
}