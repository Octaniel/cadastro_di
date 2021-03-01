import 'package:cadastro_di/app/modules/home/controllers/home_controller.dart';
import 'package:cadastro_di/app/modules/home/widgets/agree.dart';
import 'package:cadastro_di/app/modules/home/widgets/gender.dart';
import 'package:cadastro_di/app/modules/home/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'Login.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width /3.3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.lightBlue[600],
                  child: Padding(
                    padding: EdgeInsets.only(top: 85.0, right: 50.0, left: 50.0), 
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60.0,),
                          Container(
                            padding: EdgeInsets.only(
                              top: 5.0, 
                              bottom: 5.0
                            ),
                            child: Text(
                              "Vamos começar a configurar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),

                          SizedBox(height: 5.0,),
                          Container(
                            padding: EdgeInsets.only(
                              top: 5.0, 
                              bottom: 5.0
                            ),
                            child: Text(
                              "Deve levar apenas alguns minutos para criar sua conta",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          SizedBox(height: 50.0,),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15.0, right: 70.0, left: 70.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Inscrever-se",
                        style: TextStyle(
                            color: Colors.lightBlue, fontWeight: FontWeight.w600, fontSize: 35.0, fontFamily: 'Merriweather'),
                      ),
                      const SizedBox(height: 21.0),
                      InputField(
                        label: "Nome de usuário",
                        content: "imposto"
                      ),
                      SizedBox(height: 20.0),
                      Gender(),
                      SizedBox(height: 20.0),
                      InputField(
                        label: "Data de nascimento",
                        content: "03/04/2000"
                      ),
                      SizedBox(height: 20.0),
                      InputField(
                        label: "Email",
                        content: "imposto@site.com"
                      ),

                      SizedBox(height: 20.0),
                      InputField(
                        label: "Palavra Passe",
                        content: "********",
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),

                      
                      //Membership Widget from the widgets folder
                      Aggrenment(),
                      
                      SizedBox(height: 40.0,),

                      Row(
                        children: <Widget>[
                          SizedBox(width: 170.0,),
                          FlatButton(
                            color: Colors.grey[200],
                            onPressed: (){},
                            child: Text(
                              "Cancelar"
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          FlatButton(
                            color: Colors.lightBlue,
                            onPressed: (){},
                            child: Text(
                              "Criar Conta",
                              style: TextStyle(
                                color: Colors.white
                              ),
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