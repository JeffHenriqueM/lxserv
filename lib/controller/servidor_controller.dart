import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lxserv/model/servidor_model.dart';

class ServidorController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  saveCompanie(appt, {name, service, time}) async {
    final docRef = db.collection('servidores').doc();
    await docRef.set(appt.toMap()).then(
        (value) => log("Servidor Criada com Sucesso!"),
        onError: (e) => log("Erro ao criar empresa: $e"));
  }

  getServidoresCnpj(String? cnpj) async {
    late ServidorModel model;
    late List<ServidorModel> servidores = [];
    final docRef = db.collection('servidores').get();

    await docRef.then((event) {
      for (var doc in event.docs) {
        model = ServidorModel(
          idCompany: doc.data()['idCompany'],
          idHost: doc.data()['idHost'],
          host: doc.data()['host'],
          hostname: doc.data()['hostname'],
          descricao: doc.data()['descricao'],
          status: doc.data()['status'],
          so: doc.data()['so'],
          iplan: doc.data()['iplan'],
          ipwan: doc.data()['ipwan'],
          linkWAN: doc.data()['linkWAN'],
          cpu: doc.data()['cpu'],
          ram: doc.data()['ram'],
          drive: doc.data()['drive'],
          licenca: doc.data()['licenca'],
          acessoExterno: doc.data()['acessoExterno'],
          antivirus: doc.data()['antivirus'],
          backup: doc.data()['backup'],
          dtCreated: doc.data()['dtCreated'].toDate(),
        );
        if(cnpj == null) {
          servidores.add(model);
        }else if(cnpj == model.idCompany){
          servidores.add(model);
        }
      }
    });

    return servidores;
  }

  getServidores() async {
    late ServidorModel model;
    late List<ServidorModel> servidores = [];
    final docRef = db.collection('servidores').get();

    await docRef.then((event) {
      for (var doc in event.docs) {
        model = ServidorModel(
          idCompany: doc.data()['idCompany'],
          idHost: doc.data()['idHost'],
          host: doc.data()['host'],
          hostname: doc.data()['hostname'],
          descricao: doc.data()['descricao'],
          status: doc.data()['status'],
          so: doc.data()['so'],
          iplan: doc.data()['iplan'],
          ipwan: doc.data()['ipwan'],
          linkWAN: doc.data()['linkWAN'],
          cpu: doc.data()['cpu'],
          ram: doc.data()['ram'],
          drive: doc.data()['drive'],
          licenca: doc.data()['licenca'],
          acessoExterno: doc.data()['acessoExterno'],
          antivirus: doc.data()['antivirus'],
          backup: doc.data()['backup'],
          dtCreated: doc.data()['dtCreated'].toDate(),
        );
        servidores.add(model);
      }
    });

    return servidores;
  }
}
