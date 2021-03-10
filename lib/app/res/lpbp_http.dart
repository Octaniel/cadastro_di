
import 'dart:convert';

import 'package:cadastro_di/app/data/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class LpbpHttp{

  final seguranca = AuthRepository();

  Dio d = new Dio();

Future<Response> get(url, {Map<String, String> headers}) =>
    _withClient((h) => d.get(url, options: Options(headers: h)),headers);

    Future<Response> post(url,
        {Map<String, String> headers, body, Encoding encoding}) =>
    _withClient((h) =>
        d.post(url, options: Options(headers: h), data: body),headers);

        Future<Response> put(url,
        {Map<String, String> headers, body, Encoding encoding}) =>
    _withClient((h) =>
        d.put(url, options: Options(headers: h), data: body),headers);

        Future<Response> delete(url, {Map<String, String> headers}) =>
    _withClient((h) => d.delete(url, options: Options(headers: h)),headers);


  Future<T> _withClient<T>(Future<T> Function(Map<String, String> headers) fn,
      Map<String, String> headers) async {
    final storage = GetStorage();
    var accsessTokenExpirado = await seguranca.accsessTokenExpirado();
    if(accsessTokenExpirado){
      await seguranca.refreshToken();
       accsessTokenExpirado = await seguranca.accsessTokenExpirado();
     if(accsessTokenExpirado){
       return null;
    }
    }
    var read = storage.read("access_token");
    if(headers==null){
      headers = Map();
    }
    headers.addAll(<String,String>{
      "Authorization":"Bearer "+read,
    });
    return fn(headers);
  }
   
}