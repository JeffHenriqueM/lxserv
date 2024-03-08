class EmpresaModel {
  late String cnpj;
  late String razaoSocial;
  late String nomeFantasia;
  late String endereco;
  late String contato;
  late String responsavel;
  late String img;
  late DateTime dtCreated;

  EmpresaModel({
    required this.cnpj,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.endereco,
    required this.contato,
    required this.responsavel,
    required this.img,
    required this.dtCreated,
  });

  toMap() {
    return {
      'cnpj': cnpj,
      'razaoSocial': razaoSocial,
      'nomeFantasia': nomeFantasia,
      'endereco': endereco,
      'contato': contato,
      'responsavel': responsavel,
      'dtCreated': dtCreated,
    };
  }
}
