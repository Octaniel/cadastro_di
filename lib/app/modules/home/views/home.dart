import 'package:cadastro_di/app/app_controller.dart';
import 'package:cadastro_di/app/data/model/user_model.dart';
import 'package:cadastro_di/app/modules/home/controllers/home_controller.dart';
import 'package:cadastro_di/app/routes/app_pages.dart';
import 'package:cadastro_di/app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    User user = Get.find<AppController>().user;
    if(user.tbContribuinte==null)
      Get.toNamed(Routes.LOGIN);
    controller.nomeControler.text = user.tbContribuinte.tbPessoa.nomePessoa;
    controller.emailControler.text = user.emailUsuario;
    controller.telefoneControler.text = user.tbContribuinte.tbPessoa.telefonePessoa;
    controller.moradaControler.text = user.tbContribuinte.tbPessoa.enderecoPessoa;
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
                              "Vamos começar a configurar",
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
                              "Deve levar apenas alguns minutos para atualizar "
                                  "seu registro",
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
                      top: 15.0, right: 70.0, left: 70.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Atualiza-se",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 35.0,
                            fontFamily: 'Merriweather'),
                      ),
                      SizedBox(height: 25.0),
                      InputField(
                        label: "Nome",
                        content: "imposto",
                        controller: controller.nomeControler,
                        onChanged: (v){
                          user.tbContribuinte.tbPessoa.nomePessoa = v;
                        },
                      ),
                      SizedBox(height: 20.0),
                      InputField(
                        label: "Email",
                        content: "imposto@site.com",
                        controller: controller.emailControler,
                        onChanged: (v){
                          user.emailUsuario = v;
                        },
                      ),
                      SizedBox(height: 20.0),
                      InputField(
                        label: "Telefone",
                        content: "9946389",
                        controller: controller.telefoneControler,
                        onChanged: (v){
                          user.tbContribuinte.tbPessoa.telefonePessoa = v;
                        },
                      ),
                      SizedBox(height: 20.0),
                      InputField(
                        label: "Morada",
                        content: "Madre de Deus",
                        controller: controller.moradaControler,
                        onChanged: (v){
                          user.tbContribuinte.tbPessoa.enderecoPessoa = v;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 170.0,
                          ),
                          FlatButton(
                            color: Colors.lightBlue,
                            onPressed: () async {
                              if(await controller.atualizar()) {
                                Get.snackbar(
                                  "Atualizado com sucesso",
                                  'Os teus dados foram atualizado na direção '
                                      'dos impostos',
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xFF3CFEB5),
                                );
                                Future.delayed(Duration(seconds: 2), () {
                                  controller.circularProgressButaoRegistrar =
                                  false;
                                  Get.offAllNamed(Routes.LOGIN);
                                });
                              }else{
                                Get.snackbar(
                                  "Erro ao atualizar",
                                  'Ouve um problema interno ao atualizar os '
                                      'teus dados, por favor depois das 24 horas.',
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xFFFE3C3C),
                                );
                              }
                            },
                            child: Text(
                              "Atualizar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          FlatButton(
                            color: Colors.grey[200],
                            onPressed: () {
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: Text("Sair"),
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
