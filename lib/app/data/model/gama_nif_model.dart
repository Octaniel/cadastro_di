class TbGamaNif {
  int idGamaNif;
  String descGamaNif;
  int numGamaNif;
  String dtAlterGamaNif;
  String dtCriaGamaNif;

  TbGamaNif(
      {idGamaNif, descGamaNif, numGamaNif, dtAlterGamaNif, dtCriaGamaNif});

  TbGamaNif.fromJson(Map<String, dynamic> json) {
    idGamaNif = json['idGamaNif'];
    descGamaNif = json['descGamaNif'];
    numGamaNif = json['numGamaNif'];
    dtAlterGamaNif = json['dtAlterGamaNif'];
    dtCriaGamaNif = json['dtCriaGamaNif'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idGamaNif'] = idGamaNif;
    data['descGamaNif'] = descGamaNif;
    data['numGamaNif'] = numGamaNif;
    data['dtAlterGamaNif'] = dtAlterGamaNif;
    data['dtCriaGamaNif'] = dtCriaGamaNif;
    return data;
  }
}
