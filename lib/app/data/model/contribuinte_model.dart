import 'package:cadastro_di/app/data/model/pessoa_model.dart';
import 'gama_nif_model.dart';

class TbContribuinte {
  int idContribuinte;
  TbGamaNif tbGamaNif;
  TbPessoa tbPessoa;
  String nifContribuinte;
  String criaNifUsuario;
  String alterNifUsuario;
  String dtAlterContribuinte;
  String dtCriaContribuinte;
  Null categoria;

  TbContribuinte(
      {idContribuinte,
        tbGamaNif,
        tbPessoa,
        nifContribuinte,
        criaNifUsuario,
        alterNifUsuario,
        dtAlterContribuinte,
        dtCriaContribuinte,
        categoria});

  TbContribuinte.fromJson(Map<String, dynamic> json) {
    idContribuinte = json['idContribuinte'];
    tbGamaNif = json['tbGamaNif'] != null
        ? TbGamaNif.fromJson(json['tbGamaNif'])
        : null;
    tbPessoa =
    json['tbPessoa'] != null ? TbPessoa.fromJson(json['tbPessoa']) : null;
    nifContribuinte = json['nifContribuinte'];
    criaNifUsuario = json['criaNifUsuario'];
    alterNifUsuario = json['alterNifUsuario'];
    dtAlterContribuinte = json['dtAlterContribuinte'];
    dtCriaContribuinte = json['dtCriaContribuinte'];
    categoria = json['categoria'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idContribuinte'] = idContribuinte;
    if (tbGamaNif != null) {
      data['tbGamaNif'] = tbGamaNif.toJson();
    }
    if (tbPessoa != null) {
      data['tbPessoa'] = tbPessoa.toJson();
    }
    data['nifContribuinte'] = nifContribuinte;
    data['criaNifUsuario'] = criaNifUsuario;
    data['alterNifUsuario'] = alterNifUsuario;
    data['dtAlterContribuinte'] = dtAlterContribuinte;
    data['dtCriaContribuinte'] = dtCriaContribuinte;
    data['categoria'] = categoria;
    return data;
  }
}
