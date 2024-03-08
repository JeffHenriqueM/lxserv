import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmpresaController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  criarEmpresa(appt, id, {name, service, time}) async {
    final docRef = db.collection('empresas').doc(id);
    await docRef.set(appt.toMap()).then(
        (value) => log("Empresa Criada com Sucesso!"),
        onError: (e) => log("Erro ao criar empresa: $e"));

    /*db.collection('empresas').add(appt.toMap()).then(
        (value) => log("Empresa Criada com Sucesso!"),
        onError: (e) => log("Erro ao criar empresa: $e"));*/
  }
}
