import 'dart:async';

import 'package:cadastro_di/app/app_controller.dart';
import 'package:cadastro_di/app/data/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/user_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final AuthProvider userProvider = new AuthProvider();
  final User user = Get.find<AppController>().user;
  final TextEditingController nomeControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController telefoneControler = TextEditingController();
  final TextEditingController moradaControler = TextEditingController();

  set circularProgressButaoRegistrar(bool circularProgressButaoRegistrar) {

  }


  Future<bool> atualizar() async {
    user.tbContribuinte.tbPessoa.nomePessoa = nomeControler.text;
    user.emailUsuario = emailControler.text;
    user.tbContribuinte.tbPessoa.telefonePessoa = telefoneControler.text;
    user.tbContribuinte.tbPessoa.enderecoPessoa = moradaControler.text;
   return await userProvider.edit(user);
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
