import 'package:flutter/material.dart';

class AppBarLx extends StatelessWidget implements PreferredSizeWidget {
  const AppBarLx({super.key, required title}) : _title = title;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(_title),
      titleTextStyle: const TextStyle(color: Colors.blue),
      actions: [
        PopupMenuButton<int>(
          onSelected: (int value) {
            switch (value) {
              case 1:
                Navigator.pushNamed(context, '/empresas');
              case 2:
                Navigator.pushNamed(context, '/servidores');
              case 3:
                Navigator.pushNamed(context, '/createEmpresa');
              case 4:
                Navigator.pushNamed(context, '/createServidor');
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: 1,
              child: Text('Empresas'),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text('Servidores'),
            ),
            const PopupMenuItem(
              value: 3,
              child: Text('Cadastrar Empresa'),
            ),
            const PopupMenuItem(
              value: 4,
              child: Text('Cadastrar Servidor'),
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
