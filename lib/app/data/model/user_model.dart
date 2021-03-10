import 'package:cadastro_di/app/data/model/perfil_model.dart';

import 'contribuinte_model.dart';

class User {
  int idUsuario;
  TbContribuinte tbContribuinte;
  TbPerfil tbPerfil;
  String criaNifUsuario;
  String alterNifUsuario;
  String senhaUsuario;
  String senhaUsuarioRecuperacao;
  String emailUsuario;
  String nifUsuario;
  bool statusUsuario;
  bool isFirst;
  String dataCriaUsuario;
  String dataAlterUsuario;
  Null senhaUsuarioConfirmacao;

  User(
      {idUsuario,
      tbContribuinte,
      tbPerfil,
      criaNifUsuario,
      alterNifUsuario,
      senhaUsuario,
      senhaUsuarioRecuperacao,
      emailUsuario,
      nifUsuario,
      statusUsuario,
      isFirst,
      dataCriaUsuario,
      dataAlterUsuario,
      senhaUsuarioConfirmacao});

  User.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'];
    tbContribuinte = json['tbContribuinte'] != null
        ? TbContribuinte.fromJson(json['tbContribuinte'])
        : null;
    tbPerfil =
        json['tbPerfil'] != null ? TbPerfil.fromJson(json['tbPerfil']) : null;
    criaNifUsuario = json['criaNifUsuario'];
    alterNifUsuario = json['alterNifUsuario'];
    senhaUsuario = json['senhaUsuario'];
    senhaUsuarioRecuperacao = json['senhaUsuarioRecuperacao'];
    emailUsuario = json['emailUsuario'];
    nifUsuario = json['nifUsuario'];
    statusUsuario = json['statusUsuario'];
    isFirst = json['isFirst'];
    dataCriaUsuario = json['dataCriaUsuario'];
    dataAlterUsuario = json['dataAlterUsuario'];
    senhaUsuarioConfirmacao = json['senhaUsuarioConfirmacao'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idUsuario'] = idUsuario;
    if (tbContribuinte != null) {
      data['tbContribuinte'] = tbContribuinte.toJson();
    }
    if (tbPerfil != null) {
      data['tbPerfil'] = tbPerfil.toJson();
    }
    data['criaNifUsuario'] = criaNifUsuario;
    data['alterNifUsuario'] = alterNifUsuario;
    data['senhaUsuario'] = senhaUsuario;
    data['senhaUsuarioRecuperacao'] = senhaUsuarioRecuperacao;
    data['emailUsuario'] = emailUsuario;
    data['nifUsuario'] = nifUsuario;
    data['statusUsuario'] = statusUsuario;
    data['isFirst'] = isFirst;
    data['dataCriaUsuario'] = dataCriaUsuario;
    data['dataAlterUsuario'] = dataAlterUsuario;
    data['senhaUsuarioConfirmacao'] = senhaUsuarioConfirmacao;
    return data;
  }
}