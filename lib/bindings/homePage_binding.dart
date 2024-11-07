
import 'package:dummy_api/controller/app_controller.dart';
import 'package:get/get.dart';

class HomepageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
  }

}