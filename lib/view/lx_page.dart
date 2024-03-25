import 'package:flutter/material.dart';
import 'package:lxserv/widgets/app_bar.dart';

class LxPage extends StatefulWidget {
  const LxPage({super.key});

  @override
  State<LxPage> createState() => _LxPageState();
}

class _LxPageState extends State<LxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLx(title: "Gerenciamento de Servidores"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/createServidor');
                },
                child: const Text('Adicionar Servidor'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/createEmpresa');
                },
                child: const Text('Adicionar Empresa'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/empresas');
                },
                child: const Text('Lista de empresas'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/servidores');
                },
                child: const Text('Lista de Servidores'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('Buscar servidor por empresa'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
