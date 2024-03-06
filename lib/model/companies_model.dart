import 'package:cloud_firestore/cloud_firestore.dart';

class CompaniesModel {
  String idHost;
  String hostname;
  String descricao;
  String so;
  String iplan;
  String ipwan;
  String linkWAN;
  int cpu;
  int ram;
  double drive;
  String licenca;
  String antivirus;
  DateTime dtCreated;
  //late DateTime dtUpdate;
  //late DateTime dtDelete;

  CompaniesModel({
    required this.idHost,
    required this.hostname,
    required this.descricao,
    required this.so,
    required this.iplan,
    required this.ipwan,
    required this.linkWAN,
    required this.cpu,
    required this.ram,
    required this.drive,
    required this.licenca,
    required this.antivirus,
    required this.dtCreated,
  });

  fromMap(Map<String, dynamic> map) {
    return CompaniesModel(
      idHost: map['idHost'],
      hostname: map['hostname'],
      descricao: map['descricao'],
      so: map['so'],
      iplan: map['iplan'],
      ipwan: map['ipwan'],
      linkWAN: map['linkWAN'],
      cpu: map['cpu'],
      ram: map['ram'],
      drive: map['drive'],
      licenca: map['licenca'],
      antivirus: map['antivirus'],
      dtCreated: DateTime.now(),
      //dtUpdate: map['dtUpdate'].toDate(),
      //dtDelete: map['dtDelet'].toDate());
    );
  }

  toMap() {
    return {
      'idHost': idHost,
      'hostname': hostname,
      'descricao': descricao,
      'so': so,
      'iplan': iplan,
      'ipwan': ipwan,
      'linkWAN': linkWAN,
      'cpu': cpu,
      'ram': ram,
      'drive': drive,
      'licenca': licenca,
      'antivirus': antivirus,
      'dtCreated': Timestamp.fromDate(dtCreated),
      //'dtUpdate': Timestamp.fromDate(dtUpdate),
      //'dtDelet': Timestamp.fromDate(dtDelete),
    };
  }
}
