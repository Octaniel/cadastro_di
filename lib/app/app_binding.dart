import 'package:cadastro_di/app/app_controller.dart';
import 'package:get/get.dart';


class AppBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<AppController>(AppController());
  }
}
