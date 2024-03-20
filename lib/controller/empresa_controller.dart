import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lxserv/model/empresa_model.dart';

class EmpresaController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  criarEmpresa(appt, id, {name, service, time}) async {
    id = id.replaceAll(RegExp(r'[^\w\s]+'), '');
    final docRef = db.collection('empresas').doc(id);
    await docRef.set(appt.toMap()).then(
        (value) => log("Empresa Criada com Sucesso!"),
        onError: (e) => log("Erro ao criar empresa: $e"));
  }

  getEmpresas() async {
    late EmpresaModel model;
    late List<EmpresaModel> empresas = [];
    final docRef = db.collection('empresas').get();

    await docRef.then((event) {
      for (var doc in event.docs) {
        model = EmpresaModel(
          cnpj: doc.data()['cnpj'],
          razaoSocial: doc.data()['razaoSocial'],
          nomeFantasia: doc.data()['nomeFantasia'],
          endereco: doc.data()['endereco'],
          contato: doc.data()['contato'],
          responsavel: doc.data()['responsavel'],
          img: doc.data()['img'],
          filial: doc.data()['filial'],
          dtCreated: doc.data()['dtCreated'].toDate(),
        );
        empresas.add(model);
      }
    });

    return empresas;
  }
}
