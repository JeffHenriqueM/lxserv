class EmpresaModel {
  late String cnpj;
  late String razaoSocial;
  late String nomeFantasia;
  late String endereco;
  late String contato;
  late String responsavel;
  late String img;
  late bool filial;
  late DateTime dtCreated;

  EmpresaModel({
    required this.cnpj,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.endereco,
    required this.contato,
    required this.responsavel,
    required this.img,
    required this.filial,
    required this.dtCreated,
  });

  toMap() {
    return {
      'cnpj': cnpj.replaceAll(RegExp(r'[^\w\s]+'), ''),
      'razaoSocial': razaoSocial,
      'nomeFantasia': nomeFantasia,
      'endereco': endereco,
      'contato': contato,
      'responsavel': responsavel,
      'img': img,
      'filial': filial,
      'dtCreated': dtCreated,
    };
  }
}
