class ServidorModel {
  String idCompany;
  String idHost;
  bool host;
  String hostname;
  String descricao;
  String status;
  String so;
  String iplan;
  String ipwan;
  String linkWAN;
  int cpu;
  int ram;
  double drive;
  String acessoExterno;
  String licenca;
  String antivirus;
  String backup;
  DateTime dtCreated;
  String img;
  //late DateTime dtUpdate;
  //late DateTime dtDelete;

  ServidorModel({
    required this.img,
    required this.idCompany,
    required this.idHost,
    required this.host,
    required this.hostname,
    required this.descricao,
    required this.status,
    required this.so,
    required this.iplan,
    required this.ipwan,
    required this.linkWAN,
    required this.cpu,
    required this.ram,
    required this.drive,
    required this.acessoExterno,
    required this.licenca,
    required this.antivirus,
    required this.backup,
    required this.dtCreated,
  });

  fromMap(Map<String, dynamic> map) {
    return ServidorModel(
      img: map['img'],
      idCompany: map['idCompany'].replaceAll(RegExp(r'[^\w\s]+'), ''),
      idHost: map['idHost'],
      host: map['host'],
      hostname: map['hostname'],
      descricao: map['descricao'],
      status: map['status'],
      so: map['so'],
      iplan: map['iplan'],
      ipwan: map['ipwan'],
      linkWAN: map['linkWAN'],
      cpu: map['cpu'],
      ram: map['ram'],
      drive: map['drive'],
      acessoExterno: map['acessoExterno'],
      licenca: map['licenca'],
      antivirus: map['antivirus'],
      backup: map['backup'],
      dtCreated: DateTime.now(),
      //dtUpdate: map['dtUpdate'].toDate(),
      //dtDelete: map['dtDelet'].toDate());
    );
  }

  toMap() {
    return {
      'img': img,
      'idCompany': idCompany.replaceAll(RegExp(r'[^\w\s]+'), ''),
      'idHost': idHost,
      'host': host,
      'hostname': hostname,
      'descricao': descricao,
      'status': status,
      'so': so,
      'iplan': iplan,
      'ipwan': ipwan,
      'linkWAN': linkWAN,
      'cpu': cpu,
      'ram': ram,
      'drive': drive,
      'acessoExterno': acessoExterno,
      'licenca': licenca,
      'antivirus': antivirus,
      'backup': backup,
      'dtCreated': dtCreated,
      //'dtUpdate': Timestamp.fromDate(dtUpdate),
      //'dtDelet': Timestamp.fromDate(dtDelete),
    };
  }
}
