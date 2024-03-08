import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lxserv/controller/servidor_controller.dart';
import 'package:lxserv/model/servidor_model.dart';
import 'package:lxserv/widgets/widgetRowText.dart';

class CreateServidor extends StatefulWidget {
  const CreateServidor({super.key});

  @override
  State<CreateServidor> createState() => _CreateServidorState();
}

class _CreateServidorState extends State<CreateServidor> {
  ServidorController servidorController = ServidorController();
  TextEditingController idHost = TextEditingController();
  TextEditingController hostname = TextEditingController();
  TextEditingController descricao = TextEditingController();
  TextEditingController so = TextEditingController();
  TextEditingController iplan = TextEditingController();
  TextEditingController ipwan = TextEditingController();
  TextEditingController linkWAN = TextEditingController();
  TextEditingController cpu = TextEditingController();
  TextEditingController ram = TextEditingController();
  TextEditingController drive = TextEditingController();
  TextEditingController acessoExterno = TextEditingController();
  TextEditingController licenca = TextEditingController();
  TextEditingController antivirus = TextEditingController();
  late ServidorModel servidorModel;
  final _formKey = GlobalKey<FormState>();
  List<String> virtualizadores = [
    'SFPROX0110',
    'SFPROX0220',
    'SFPROX0330',
    'SFPROX0440',
    'SFPROX0550'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cadastrar Servidor"),
          titleTextStyle: const TextStyle(color: Colors.blue),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/createEmpresa');
                },
                icon: const Icon(Icons.computer_sharp)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/servidores');
                },
                icon: const Icon(Icons.table_rows)),
          ],
        ),
        body: Center(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetRowText(controller: idHost, title: "Virtualizador"),
                  WidgetRowText(controller: hostname, title: "HOSTNAME"),
                  WidgetRowText(controller: iplan, title: "IP - LAN"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetRowText(controller: ipwan, title: "IP - WAN"),
                  WidgetRowText(controller: linkWAN, title: "Link WAN"),
                  WidgetRowText(controller: descricao, title: "Descrição"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetRowNumber(controller: cpu, title: "CPU"),
                  WidgetRowNumber(controller: ram, title: "RAM"),
                  WidgetRowNumber(controller: drive, title: "Drive"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetRowText(
                      controller: acessoExterno, title: "Acesso Externo"),
                  WidgetRowText(controller: so, title: "SO"),
                  WidgetRowText(controller: licenca, title: "Licença"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetRowText(controller: antivirus, title: "Antivirus"),
                ],
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    int cpus = int.parse(cpu.text);
                    int rams = int.parse(ram.text);
                    double drives = double.parse(drive.text);

                    //Resolver de outra maneira
                    String cnpj = "13505252000114";
                    bool host = false;
                    String status = "Active";
                    String backup = "Acronis/Bareos";

                    ServidorModel servidorModel = ServidorModel(
                        idCompany: cnpj,
                        idHost: idHost.text,
                        host: host,
                        hostname: hostname.text,
                        descricao: descricao.text,
                        status: status,
                        so: so.text,
                        iplan: iplan.text,
                        ipwan: ipwan.text,
                        linkWAN: linkWAN.text,
                        cpu: cpus,
                        ram: rams,
                        drive: drives,
                        acessoExterno: acessoExterno.text,
                        licenca: licenca.text,
                        antivirus: antivirus.text,
                        backup: backup,
                        dtCreated: DateTime.now());
                    servidorController.saveCompanie(servidorModel);
                    Navigator.pushNamed(context, '/servidores');

                    /*for (var element in jsonCompanies) { -- Adicionar tudo vindo de um json
                        servidorModel = ServidorModel(
                            idHost: element['idHost'].toString(),
                            hostname: element['hostname'].toString(),
                            descricao: element['descricao'].toString(),
                            so: element['so'].toString(),
                            iplan: element['iplan'].toString(),
                            ipwan: element['ipwan'].toString(),
                            linkWAN: element['linkWAN'].toString(),
                            cpu: int.parse(element['cpu'].toString()),
                            ram: int.parse(element['ram'].toString()),
                            drive: double.parse(element['drive'].toString()),
                            licenca: element['licenca'].toString(),
                            antivirus: element['antivirus'].toString(),
                            dtCreated: DateTime.now());
                        servidorController.saveCompanie(servidorModel);
                      }*/
                  },
                  child: const Text(
                    "Salvar",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              )
            ],
          ),
        )));
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
