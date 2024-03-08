import 'package:flutter/material.dart';
import 'package:lxserv/controller/empresa_controller.dart';
import 'package:lxserv/model/empresa_model.dart';
import 'package:lxserv/widgets/widgetRowText.dart';

class CreateEmpresa extends StatefulWidget {
  const CreateEmpresa({super.key});

  @override
  State<CreateEmpresa> createState() => _CreateEmpresaState();
}

class _CreateEmpresaState extends State<CreateEmpresa> {
  EmpresaController empresaController = EmpresaController();
  TextEditingController cnpj = TextEditingController();
  TextEditingController nomeFantasia = TextEditingController();
  TextEditingController razaoSocial = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController contato = TextEditingController();
  TextEditingController responsavel = TextEditingController();
  TextEditingController img = TextEditingController();
  late EmpresaModel empresaModel;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cadastrar Empresa"),
          titleTextStyle: const TextStyle(color: Colors.blue),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/empresas');
                },
                icon: const Icon(Icons.table_rows))
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
                  WidgetRowCnpj(controller: cnpj, title: "CNPJ"),
                  WidgetRowText(controller: razaoSocial, title: "Razão Social"),
                  WidgetRowText(
                      controller: nomeFantasia, title: "Nome Fantasia"),
                  WidgetRowText(
                      controller: endereco, title: "Endereço completo"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WidgetRowText(controller: contato, title: "Contato"),
                  WidgetRowText(
                      controller: responsavel, title: "Nome responsável"),
                  WidgetRowText(controller: img, title: "Link imagem"),
                ],
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    EmpresaModel empresaModel = EmpresaModel(
                        cnpj: cnpj.text,
                        endereco: endereco.text,
                        razaoSocial: razaoSocial.text,
                        nomeFantasia: razaoSocial.text,
                        contato: contato.text,
                        responsavel: responsavel.text,
                        img: img.text,
                        dtCreated: DateTime.now());
                    empresaController.criarEmpresa(
                        empresaModel, empresaModel.cnpj);
                    Navigator.pushNamed(context, '/empresas');
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
}
