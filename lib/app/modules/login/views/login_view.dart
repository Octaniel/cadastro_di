import 'package:cadastro_di/app/app_controller.dart';
import 'package:cadastro_di/app/routes/app_pages.dart';
import 'package:cadastro_di/app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController nif = TextEditingController();
  final TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.lightBlue[600],
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 85.0, right: 50.0, left: 50.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "Vá em frente e faça login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "Deve levar apenas alguns segundos para fazer o login em sua conta",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 140.0, right: 70.0, left: 70.0, bottom: 5.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 35.0,
                            fontFamily: 'Merriweather'),
                      ),
                      const SizedBox(height: 21.0),

                      //InputField Widget from the widgets folder
                      InputField(
                        label: "Nif",
                        content: "999999999",
                        controller: nif,
                      ),

                      SizedBox(height: 20.0),

                      InputField(
                        label: "Password",
                        content: "\$\$\$\$\$\$\$",
                        obscureText: true,
                        controller: senha,
                      ),

                      SizedBox(height: 20.0),

                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 170.0,
                          ),
                          FlatButton(
                            color: Colors.lightBlue,
                            onPressed: () async {
                              var find = Get.find<AppController>();
                              if (await find.login(nif.text, senha.text)) {
                                find.refreshUsuario();
                                print('ooooooooooooooo');
                                Get.snackbar(
                                  "Logado com sucesso",
                                  'Bem vindo(a)',
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xFF3CFEB5),
                                );
                                Future.delayed(Duration(seconds: 2), () {
                                  controller.circularProgressButaoRegistrar =
                                      false;
                                  Get.offAllNamed(Routes.HOME);
                                });
                              } else {
                                print('ooooooooooooooo');
                                Get.snackbar(
                                  "Erro ao logar",
                                  'Nif ou Senha Invalido(a)',
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xFFFE3C3C),
                                );
                                Future.delayed(Duration(seconds: 2), () {
                                  controller.circularProgressButaoRegistrar =
                                      false;
                                });
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
