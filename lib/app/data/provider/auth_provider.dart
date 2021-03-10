import 'dart:async';
import 'dart:convert';

import 'package:cadastro_di/app/data/model/user_model.dart';
import 'package:cadastro_di/app/res/lpbp_http.dart';
import 'package:cadastro_di/app/res/static.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider extends GetConnect {
  final baseUrl = url;

  Future<List<User>> getAll() async {
    try {
      var response = await LpbpHttp().get('usuarios');
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.data);
        var listUsuario = jsonResponse.map<User>((map) {
          return User.fromJson(map);
        }).toList();
        return listUsuario;
      } else {
        print('erro -get');
      }
    } catch (_) {}
    return [];
  }

  FutureOr<User> getId(int id) async {
    final storage = GetStorage();
    var read = storage.read("access_token");
    var response = await get('usuarios/$id',
        contentType: 'application/json',
        headers: <String, String>{"Authorization":"Bearer "+read});
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    } else {
      print('erro -get');
    }
    return null;
  }

  FutureOr<bool> login(String nif, String senha) async {
    String login = "username=$nif&password=$senha&grant_type=password";
    print('response.statusCode');
    final response = await post("oauth/token", login,
        contentType: "application/x-www-form-urlencoded",
        headers: <String, String>{
          "Authorization": "Basic YW5ndWxhcjpAbmd1bEByMA==",
          "bmobile": " ",
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final storage = GetStorage();
      print(response.body);
      var decode = response.body;
      storage.write("nomeUsuario", decode["nome"]);
      storage.write("idUsuario", decode["idUsuario"]);
      storage.write("access_token", decode["access_token"]);
      storage.write("date_expires_in", DateTime.now().toString());
      storage.write("expires_in", decode["expires_in"].toString());
      storage.write("refresh_token", decode["refresh_token"].toString());
      return true;
    }
    return false;
  }

  Future<bool> add(User obj) async {
    var response = await post('${baseUrl}usuarios/add', obj,
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      return true;
    } else {
      print('erro -post');
    }
    return false;
  }

  Future<bool> edit(User obj) async {
    final storage = GetStorage();
    var read = storage.read("access_token");
    try {
      print("response.statusCode");
      var response = await post('usuarios/atualizarViaASIGAR',
          obj.toJson(),
          contentType: 'application/json',
          headers: {'Authorization': 'Bearer $read'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        print('erro -put');
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  Future<bool> logout() async {
    final httpfat = LpbpHttp();
    final storage = GetStorage();
    var response = await httpfat.delete("${baseUrl}tokens/revoke");
    if (response.statusCode == 204) {
      await storage.erase();
      print(true);
      return true;
    }
//    await storage.clear();
    return false;
  }

  Future<bool> accsessTokenExpirado() async {
    final storage = GetStorage();
    var read = storage.read("date_expires_in");
    var read1 = storage.read("expires_in");
    if (read == null) return true;
    var date = DateTime.parse(read);
    int i = int.parse(read1);
    date = date.add(Duration(seconds: i));
    if (date.isAfter(DateTime.now())) {
      return false;
    }
    return true;
  }

  Future<void> refreshToken() async {
    final storage = GetStorage();
    var read1 = storage.read("refresh_token");
    var response = await post("${baseUrl}oauth/token", <String, String>{
      "grant_type": "refresh_token",
      "refresh_token": read1 == null ? "" : read1
    }, headers: <String, String>{
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Basic YW5ndWxhcjpAbmd1bEByMA==",
    });
    if (response.statusCode == 200) {
      var decode = response.body;
      storage.write("access_token", decode["access_token"]);
      storage.write("date_expires_in", DateTime.now().toString());
      storage.write("expires_in", decode["expires_in"].toString());
    }
  }

  Future<bool> verificarERenovarToken() async {
    if (await accsessTokenExpirado()) {
      await refreshToken();
      if (await accsessTokenExpirado()) {
        return false;
      }
    }
    return true;
  }



  Future<bool> apagar(int id) async {
    try {
      var response = await delete(baseUrl);
      if (response.statusCode == 200) {
        return true;
      } else {
        print('erro -delete');
      }
    } catch (_) {}
    return false;
  }
}
