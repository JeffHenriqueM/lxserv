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
  CompaniesModel companiesModel = CompaniesModel(
      idHost: "1",
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar empresa"),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          TextButton(
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
                for (var element in jsonCompanies) {
                  controller.saveCompanie(companiesModel.fromJson(element));
                }
              },
              child: const Text('Salvar')),
        ],
      ),
    );
  }

  var jsonCompanies = [
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMANASTACIO01",
      "descricao": "Banco",
      "iplan": "172.30.5.11",
      "ipwan": "201.56.59.38",
      "linkWAN": "Embratel-DED-01",
      "cpu": 2,
      "ram": 8,
      "drive": 100,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMANASTACIO02",
      "descricao": "TS - Crack",
      "iplan": "172.30.5.12",
      "ipwan": "201.56.59.38",
      "linkWAN": "Embratel-DED-01",
      "cpu": 4,
      "ram": 8,
      "drive": 100,
      "so": "WS12ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMAQUIDAUANA01",
      "descricao": "Banco",
      "iplan": "172.30.1.11",
      "ipwan": "201.56.59.39",
      "linkWAN": "Embratel-DED-01",
      "cpu": 4,
      "ram": 8,
      "drive": 150,
      "so": "WS19ST",
      "licenca": "...PKFBQ",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMAQUIDAUANA02",
      "descricao": "TS - AADS",
      "iplan": "172.30.1.12",
      "ipwan": "201.56.59.39",
      "linkWAN": "Embratel-DED-01",
      "cpu": 4,
      "ram": 8,
      "drive": 150,
      "so": "WS19ST",
      "licenca": "...PKFBQ",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMCHAPADAO01",
      "descricao": "Banco",
      "iplan": "172.30.0.21",
      "ipwan": "201.56.59.36",
      "linkWAN": "Embratel-DED-01",
      "cpu": 12,
      "ram": 32,
      "drive": 500,
      "so": "WS19ST",
      "licenca": "...PKFBQ",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMCHAPADAO02",
      "descricao": "Banco",
      "iplan": "172.30.0.22",
      "ipwan": "201.56.59.36",
      "linkWAN": "Embratel-DED-01",
      "cpu": 2,
      "ram": 8,
      "drive": 100,
      "so": "WS19ST",
      "licenca": "...PKFBQ",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMINOCENCIA01",
      "descricao": "Banco",
      "iplan": "172.30.4.11",
      "ipwan": "201.56.59.40",
      "linkWAN": "Embratel-DED-01",
      "cpu": 2,
      "ram": 8,
      "drive": 100,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMINOCENCIA02",
      "descricao": "TS - Crack",
      "iplan": "172.30.4.12",
      "ipwan": "201.56.59.40",
      "linkWAN": "Embratel-DED-01",
      "cpu": 2,
      "ram": 8,
      "drive": 100,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMPPORA01",
      "descricao": "Banco - RH",
      "iplan": "172.30.6.11",
      "ipwan": "201.56.59.35",
      "linkWAN": "Embratel-DED-01",
      "cpu": 8,
      "ram": 24,
      "drive": 150,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMPPORA02",
      "descricao": "Banco - Tributos",
      "iplan": "172.30.6.12",
      "ipwan": "201.56.59.35",
      "linkWAN": "Embratel-DED-01",
      "cpu": 4,
      "ram": 16,
      "drive": 200,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMPPORA03",
      "descricao": "Banco - Contabil",
      "iplan": "172.30.6.13",
      "ipwan": "201.56.59.35",
      "linkWAN": "Embratel-DED-01",
      "cpu": 6,
      "ram": 32,
      "drive": 350,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMPPORA04",
      "descricao": "TS - Crack",
      "iplan": "172.30.6.14",
      "ipwan": "201.56.59.35",
      "linkWAN": "Embratel-DED-01",
      "cpu": 8,
      "ram": 30,
      "drive": 100,
      "so": "WS12ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMSELVIRIA01",
      "descricao": "Banco",
      "iplan": "172.30.7.11",
      "ipwan": "201.56.59.37",
      "linkWAN": "Embratel-DED-01",
      "cpu": 2,
      "ram": 8,
      "drive": 100,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0110",
      "hostname": "SVPMSELVIRIA02",
      "descricao": "TS - Crack",
      "iplan": "172.30.7.12",
      "ipwan": "201.56.59.37",
      "linkWAN": "Embratel-DED-01",
      "cpu": 4,
      "ram": 8,
      "drive": 100,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0220",
      "hostname": "SVDCK0106",
      "descricao": "Docker Desenv.",
      "iplan": "172.30.255.6",
      "ipwan": "201.56.59.46",
      "linkWAN": "Embratel-DED-01",
      "cpu": 2,
      "ram": 8,
      "drive": 220,
      "so": "Deb11",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0220",
      "hostname": "SVDCK0207",
      "descricao": "Docker Desenv.",
      "iplan": "172.30.255.7",
      "ipwan": "201.56.59.46",
      "linkWAN": "Embratel-DED-01",
      "cpu": 2,
      "ram": 8,
      "drive": 654,
      "so": "Deb11",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0220",
      "hostname": "SVPMAMAMBAI01",
      "descricao": "Banco",
      "iplan": "172.30.2.11",
      "ipwan": "201.56.59.34",
      "linkWAN": "Embratel-DED-01",
      "cpu": 6,
      "ram": 12,
      "drive": 1100,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0220",
      "hostname": "SVAPPRCM01",
      "descricao": "Banco",
      "iplan": "172.16.9.11",
      "ipwan": "191.33.225.181",
      "linkWAN": "Vivo-DED-01",
      "cpu": 4,
      "ram": 8,
      "drive": 250,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0220",
      "hostname": "SVCMSORRISO01",
      "descricao": "Docker",
      "iplan": "172.30.8.11",
      "ipwan": "191.33.225.178",
      "linkWAN": "Vivo-DED-01",
      "cpu": 4,
      "ram": 16,
      "drive": 500,
      "so": "DEB11",
      "licenca": "Open",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0220",
      "hostname": "SVDC0221",
      "descricao": "AD Secundario",
      "iplan": "172.30.255.21",
      "ipwan": "189.7.73.65",
      "linkWAN": "NET IP Fixo",
      "cpu": 2,
      "ram": 4,
      "drive": 50,
      "so": "WS19ST",
      "licenca": "KMS",
      "antivirus": "OK"
    },
    {
      "idHost": "SFPROX0220",
      "hostname": "SVPMPPORA05",
      "descricao": "Docker",
      "iplan": "172.30.6.15",
      "ipwan": "201.56.59.35",
      "linkWAN": "Embratel-DED-01",
      "cpu": 10,
      "ram": 48,
      "drive": 580,
      "so": "DEB12",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0330",
      "hostname": "SVLAB0111",
      "descricao": "Laboratório",
      "iplan": "172.30.252.11",
      "ipwan": "191.33.225.182",
      "linkWAN": "Vivo-DED-01",
      "cpu": 2,
      "ram": 4,
      "drive": 108,
      "so": "Alm 8",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0330",
      "hostname": "SVLAB0212",
      "descricao": "Laboratório",
      "iplan": "172.30.252.12",
      "ipwan": "191.33.225.182",
      "linkWAN": "Vivo-DED-01",
      "cpu": 2,
      "ram": 4,
      "drive": 108,
      "so": "Alm 8",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0330",
      "hostname": "SVLAB0313",
      "descricao": "Laboratório",
      "iplan": "172.30.252.13",
      "ipwan": "191.33.225.182",
      "linkWAN": "Vivo-DED-01",
      "cpu": 2,
      "ram": 4,
      "drive": 108,
      "so": "Alm 8",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0330",
      "hostname": "SVLAB0414",
      "descricao": "Laboratório",
      "iplan": "172.30.252.14",
      "ipwan": "191.33.225.182",
      "linkWAN": "Vivo-DED-01",
      "cpu": 2,
      "ram": 4,
      "drive": 108,
      "so": "Alm 8",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0550",
      "hostname": "SVPMCACOAL01",
      "descricao": "Docker Desenv.",
      "iplan": "172.30.10.11 - 172.30.250.10",
      "ipwan": "177.174.64.34",
      "linkWAN": "Vivo-DED-02",
      "cpu": 6,
      "ram": 24,
      "drive": 2608,
      "so": "DEB11",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0550",
      "hostname": "SVPMRCRESPO01",
      "descricao": "Docker Desenv.",
      "iplan": "172.30.11.11 - 172.30.250.11",
      "ipwan": "177.174.64.36",
      "linkWAN": "Vivo-DED-02",
      "cpu": 4,
      "ram": 16,
      "drive": 324,
      "so": "DEB11",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0550",
      "hostname": "SVPMSMGUAPORE01",
      "descricao": "Docker Desenv.",
      "iplan": "172.30.12.11 - 172.30.250.12",
      "ipwan": "177.174.64.37",
      "linkWAN": "Vivo-DED-02",
      "cpu": 4,
      "ram": 16,
      "drive": 324,
      "so": "DEB11",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0550",
      "hostname": "SVPMVILHENA01",
      "descricao": "Docker Desenv.",
      "iplan": "172.30.3.11 - 172.30.250.3",
      "ipwan": "177.174.64.35",
      "linkWAN": "Vivo-DED-02",
      "cpu": 6,
      "ram": 32,
      "drive": 2124,
      "so": "DEB11",
      "licenca": "Free",
      "antivirus": "NA"
    },
    {
      "idHost": "SFPROX0550",
      "hostname": "SVPMCHAPADAO03",
      "descricao": "Docker Desenv.",
      "iplan": "172.30.0.23",
      "ipwan": "201.56.59.36",
      "linkWAN": "Embratel-DED-01",
      "cpu": 4,
      "ram": 16,
      "drive": 101,
      "so": "WS12ST",
      "licenca": "KMS",
      "antivirus": "NA"
    }
  ];
}
