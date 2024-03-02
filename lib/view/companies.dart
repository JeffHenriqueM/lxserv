import 'package:flutter/material.dart';
import 'package:lxserv/controller/companies_controller.dart';
import 'package:lxserv/model/companies_model.dart';

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  CompaniesController controller = CompaniesController();
  CompaniesModel companiesModel1 = CompaniesModel(
      idHost: 1,
      hostname: "SVPMANASTACIO01",
      descricao: "Banco",
      so: "WS19ST",
      iplan: "172.30.5.11",
      ipwan: "201.56.59.38",
      linkWAN: "201.56.59.38:53011",
      cpu: 2,
      ram: 8,
      drive: 100,
      licenca: "KMS",
      antivirus: "OK",
      dtCreated: DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.blue.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.blue.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {
          controller.saveCompanie(companiesModel1);
        },
        child: const Text('Criar empresa'));
  }
}
