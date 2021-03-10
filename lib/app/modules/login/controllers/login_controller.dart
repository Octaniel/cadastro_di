import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final _circularProgressButaoRegistrar = false.obs;

  bool get circularProgressButaoRegistrar => _circularProgressButaoRegistrar.value;

  set circularProgressButaoRegistrar(bool value) {
    _circularProgressButaoRegistrar.value = value;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
