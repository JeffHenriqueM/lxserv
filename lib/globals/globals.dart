library my_prj.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lxserv/model/empresa_model.dart';

bool isLoggedIn = false;
FirebaseFirestore db = FirebaseFirestore.instance;
List<EmpresaModel> empresas = [];
