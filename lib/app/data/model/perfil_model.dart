class TbPerfil {
  int idPerfil;
  String descPerfil;
  String dataCriaPerfil;
  String dataAlterPerfil;

  TbPerfil({idPerfil, descPerfil, dataCriaPerfil, dataAlterPerfil});

  TbPerfil.fromJson(Map<String, dynamic> json) {
    idPerfil = json['idPerfil'];
    descPerfil = json['descPerfil'];
    dataCriaPerfil = json['dataCriaPerfil'];
    dataAlterPerfil = json['dataAlterPerfil'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idPerfil'] = idPerfil;
    data['descPerfil'] = descPerfil;
    data['dataCriaPerfil'] = dataCriaPerfil;
    data['dataAlterPerfil'] = dataAlterPerfil;
    return data;
  }
}
