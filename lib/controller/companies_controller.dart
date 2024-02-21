import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lxserv/model/companies_model.dart';

class CompaniesController {
  final db = FirebaseFirestore.instance;

  bookSession({name, service, time}) async {
    final docRef = db.collection('appointments').doc();
    CompaniesModel appt = CompaniesModel(idHost: 1, hostname: "teste");

    await docRef.set(appt.toJson()).then(
        (value) => log("Appointment booked successfully!"),
        onError: (e) => log("Error booking appointment: $e"));
  }
}
