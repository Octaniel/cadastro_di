import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/model/user_model.dart';
import 'data/provider/auth_provider.dart';

class AppController extends GetxController {
  //TODO: Implement LoginController
  User user = new User();
  final AuthProvider oauthProvider = new AuthProvider();

  Future<bool> login(String nif, String senha) async {
    return await oauthProvider.login(nif, senha);
  }

  Future<void> refreshUsuario() async {
    final storage = GetStorage();
    var parse = int.parse(storage.read("idUsuario").toString());
    user = await oauthProvider.getId(parse);
  }

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
}
