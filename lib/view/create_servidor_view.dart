import 'package:flutter/material.dart';
import 'package:lxserv/controller/empresa_controller.dart';
import 'package:lxserv/controller/servidor_controller.dart';
import 'package:lxserv/model/empresa_model.dart';
import 'package:lxserv/model/servidor_model.dart';
import 'package:lxserv/widgets/WidgetsForm.dart';
import 'package:lxserv/globals/globals.dart' as globals;

class CreateServidor extends StatefulWidget {
  const CreateServidor({super.key});

  @override
  State<CreateServidor> createState() => _CreateServidorState();
}

class _CreateServidorState extends State<CreateServidor> {
  ServidorController servidorController = ServidorController();
  EmpresaController empresaController = EmpresaController();
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
  String cnpj = "";
  late ServidorModel servidorModel;
  List<EmpresaModel> empresas = [];
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
    buscarDados();
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
                  DropdownMenu(
                    hintText: "Selecione a empresa",
                    width: 400,
                    dropdownMenuEntries: empresas
                        .map<DropdownMenuEntry<EmpresaModel>>(
                            (EmpresaModel value) {
                      return DropdownMenuEntry<EmpresaModel>(
                          value: value, label: value.nomeFantasia);
                    }).toList(),
                    onSelected: (EmpresaModel? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        cnpj = value!.cnpj;
                      });
                    },
                  ),
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

  void buscarDados() async {
    List<EmpresaModel> list = await empresaController.getEmpresas();
    setState(() {
      empresas = list;
    });
  }
}
