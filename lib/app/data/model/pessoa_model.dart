class TbPessoa {
  int idPessoa;
  bool btStatus;
  String nomePessoa;
  String sobreNomePessoa;
  String identidade;
  String nifPessoa;
  String enderecoPessoa;
  String telefonePessoa;
  String dtAlterPessoa;
  String dtCriaPessoa;

  TbPessoa(
      {idPessoa,
        btStatus,
        nomePessoa,
        sobreNomePessoa,
        identidade,
        nifPessoa,
        enderecoPessoa,
        telefonePessoa,
        dtAlterPessoa,
        dtCriaPessoa});

  TbPessoa.fromJson(Map<String, dynamic> json) {
    idPessoa = json['idPessoa'];
    btStatus = json['btStatus'];
    nomePessoa = json['nomePessoa'];
    sobreNomePessoa = json['sobreNomePessoa'];
    identidade = json['identidade'];
    nifPessoa = json['nifPessoa'];
    enderecoPessoa = json['enderecoPessoa'];
    telefonePessoa = json['telefonePessoa'];
    dtAlterPessoa = json['dtAlterPessoa'];
    dtCriaPessoa = json['dtCriaPessoa'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idPessoa'] = idPessoa;
    data['btStatus'] = btStatus;
    data['nomePessoa'] = nomePessoa;
    data['sobreNomePessoa'] = sobreNomePessoa;
    data['identidade'] = identidade;
    data['nifPessoa'] = nifPessoa;
    data['enderecoPessoa'] = enderecoPessoa;
    data['telefonePessoa'] = telefonePessoa;
    data['dtAlterPessoa'] = dtAlterPessoa;
    data['dtCriaPessoa'] = dtCriaPessoa;
    return data;
  }
}
