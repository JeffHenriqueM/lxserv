import 'package:flutter/material.dart';
import 'package:lxserv/controller/empresa_controller.dart';
import 'package:lxserv/controller/servidor_controller.dart';
import 'package:lxserv/model/empresa_model.dart';
import 'package:lxserv/model/servidor_model.dart';
import 'package:lxserv/widgets/app_bar.dart';
import 'package:lxserv/widgets/column_form.dart';
import 'package:lxserv/widgets/widgetsform.dart';

class CreateServidor extends StatefulWidget {
  const CreateServidor({super.key});

  @override
  State<CreateServidor> createState() => _CreateServidorState();
}

class _CreateServidorState extends State<CreateServidor> {
  ServidorController servidorController = ServidorController();
  EmpresaController empresaController = EmpresaController();
  TextEditingController img = TextEditingController();
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
  TextEditingController cnpj = TextEditingController();
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
        appBar: const AppBarLx(title: "Cadastrar Servidor"),
        body: Center(
            child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColumnForm(
                      title: "Identificação",
                      widgets: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DropdownMenu(
                                hintText: "Selecione a empresa",
                                width: 300,
                                controller: cnpj,
                                dropdownMenuEntries: empresas
                                    .map<DropdownMenuEntry<EmpresaModel>>(
                                        (EmpresaModel value) {
                                  return DropdownMenuEntry<EmpresaModel>(
                                      value: value, label: value.nomeFantasia);
                                }).toList(),
                              ),
                              WidgetRowText(
                                  controller: idHost, title: "Virtualizador"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WidgetRowText(
                                  controller: hostname, title: "HOSTNAME"),
                              WidgetRowText(
                                  controller: descricao, title: "Descrição"),
                            ],
                          ),
                        ],
                      )),
                  ColumnForm(
                    title: "Informações",
                    widgets: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetRowText(controller: iplan, title: "IP - LAN"),
                            WidgetRowText(controller: ipwan, title: "IP - WAN"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetRowText(
                                controller: linkWAN, title: "Link WAN"),
                            WidgetRowText(
                                controller: acessoExterno,
                                title: "Acesso Externo"),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColumnForm(
                    title: "Hardware",
                    widgets: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetRowNumber(controller: cpu, title: "CPU"),
                            WidgetRowNumber(controller: ram, title: "RAM"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetRowNumber(controller: drive, title: "Drive"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ColumnForm(
                    title: "Sistema",
                    widgets: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetRowText(controller: so, title: "SO"),
                            WidgetRowText(
                                controller: licenca, title: "Licença"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetRowText(
                                controller: antivirus, title: "Antivirus"),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Criando servidor')),
                    );

                    int cpus = int.parse(cpu.text);
                    int rams = int.parse(ram.text);
                    double drives = double.parse(drive.text);

                    //Resolver de outra maneira
                    bool host = false;
                    String status = "Active";
                    String backup = "Acronis/Bareos";

                    ServidorModel servidorModel = ServidorModel(
                        img: img.text,
                        idCompany: cnpj.value.text,
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
                    servidorController.criarServidor(servidorModel);
                    Navigator.pushNamed(context, '/servidores');
                  }
                },
                child: const Text('Submit'),
              ),
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
