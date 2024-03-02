import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CompaniesController {
  final db = FirebaseFirestore.instance;

  saveCompanie(appt, {name, service, time}) async {
    final docRef = db.collection('companies').doc();

    await docRef.set(appt.toJson()).then(
        (value) => log("Empresa Criada com Sucesso!"),
        onError: (e) => log("Error booking empresa: $e"));
  }

  getCompanies() async {
    final docRef = db.collection('companies');

    docRef.get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
