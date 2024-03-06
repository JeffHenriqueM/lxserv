import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lxserv/model/companies_model.dart';

class CompaniesController {
  final db = FirebaseFirestore.instance;

  saveCompanie(appt, {name, service, time}) async {
    final docRef = db.collection('companies').doc();

    await docRef.set(appt.toMap()).then(
        (value) => log("Empresa Criada com Sucesso!"),
        onError: (e) => log("Erro ao criar empresa: $e"));
  }

  getCompanies() async {
    late CompaniesModel model;
    late List<CompaniesModel> companies = [];
    final docRef = db.collection('companies').get();

    await docRef.then((event) {
      for (var doc in event.docs) {
        model = CompaniesModel(
          idHost: doc.data()['idHost'],
          hostname: doc.data()['hostname'],
          descricao: doc.data()['descricao'],
          so: doc.data()['so'],
          iplan: doc.data()['iplan'],
          ipwan: doc.data()['ipwan'],
          linkWAN: doc.data()['linkWAN'],
          cpu: doc.data()['cpu'],
          ram: doc.data()['ram'],
          drive: doc.data()['drive'],
          licenca: doc.data()['licenca'],
          antivirus: doc.data()['antivirus'],
          dtCreated: DateTime.now(),
        );
        try {
          companies.add(model);
        } catch (e) {
          print(e);
        }
      }
    });

    return companies;
  }
}
