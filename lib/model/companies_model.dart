import 'package:cloud_firestore/cloud_firestore.dart';

class CompaniesModel {
  final int idHost;
  final String hostname;
  final String descricao;
  final String so;
  final String iplan;
  final String ipwan;
  final String linkWAN;
  final int cpu;
  final int ram;
  final double drive;
  final String licenca;
  final String antivirus;
  final DateTime dtCreated;
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

  factory CompaniesModel.fromJson(Map<String, dynamic> json) {
    return CompaniesModel(
      idHost: json['idHost'],
      hostname: (json['hostname']),
      descricao: json['descricao'],
      so: json['so'],
      iplan: json['iplan'],
      ipwan: json['ipwan'],
      linkWAN: json['linkWAN'],
      cpu: json['cpu'],
      ram: json['ram'],
      drive: json['drive'],
      licenca: json['licenca'],
      antivirus: json['antivirus'],
      dtCreated: json['dtCreated'].toDate(),
      //dtUpdate: json['dtUpdate'].toDate(),
      //dtDelete: json['dtDelet'].toDate());
    );
  }

  toJson() {
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
