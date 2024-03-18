import 'package:flutter/material.dart';
import 'package:lxserv/controller/empresa_controller.dart';
import 'package:lxserv/model/empresa_model.dart';
import 'package:lxserv/view/servidores_table.dart';
import 'package:lxserv/widgets/app_bar.dart';
import 'package:lxserv/widgets/data_grid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/services.dart';

class EmpresasDataTableFlutter extends StatefulWidget {
  const EmpresasDataTableFlutter({super.key});

  @override
  State<EmpresasDataTableFlutter> createState() =>
      _EmpresasDataTableFlutterState();
}

class _EmpresasDataTableFlutterState extends State<EmpresasDataTableFlutter> {
  EmpresaController servidorController = EmpresaController();
  List<EmpresaModel> empresas = [];
  late EmpresaModel model;
  late DataSourceEmpresa _empresaDataSource = DataSourceEmpresa(empresas);
  final DataGridController _dataGridController = DataGridController();

  @override
  void initState() {
    super.initState();
    buscarDados();
  }

  List<GridColumn> colunas = [
    GridColumn(
        columnName: 'cnpj',
        label: const Text(
          'CNPJ',
        )),
    GridColumn(
        columnName: 'razaoSocial',
        label: const Text(
          'Razão Social',
        )),
    GridColumn(
        columnName: 'nomeFantasia',
        label: const Text(
          'Nome',
        )),
    GridColumn(
        columnName: 'endereco',
        label: const Text(
          'Endereço',
        )),
    GridColumn(
        columnName: 'contato',
        label: const Text(
          'Contato',
        )),
    GridColumn(
        columnName: 'responsavel',
        label: const Text(
          'Responsável',
        )),
    GridColumn(
        columnName: 'filial',
        label: const Text(
          'Filial',
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLx(title: "Listagem de Empresas"),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        String? clipboard = _dataGridController.selectedRow
                            ?.getCells()
                            .elementAt(
                                _dataGridController.currentCell.columnIndex)
                            .value
                            .toString();
                        Clipboard.setData(ClipboardData(text: clipboard!));
                      },
                      icon: const Icon(Icons.copy)),
                  IconButton(
                      onPressed: () {
                        String? cnpj = _dataGridController.selectedRow
                            ?.getCells()
                            .elementAt(
                                _dataGridController.currentCell.columnIndex)
                            .value
                            .toString();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ServidoresDataTableFlutter(cnpj: cnpj!),
                          ),
                        );
                      },
                      icon: const Icon(Icons.table_restaurant)),
                  WidgetSfDataGrid(
                      controller: _dataGridController,
                      dataSource: _empresaDataSource,
                      colunas: colunas),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: WidgetSfDataGrid(
                  controller: _dataGridController,
                  dataSource: _empresaDataSource,
                  colunas: colunas),
            );
          }
        },
      ),
    );
  }

  void buscarDados() async {
    List<EmpresaModel> list = await servidorController.getEmpresas();
    empresas = list;
    setState(() {
      _empresaDataSource = DataSourceEmpresa(empresas);
    });
  }
}

class DataSourceEmpresa extends DataGridSource {
  DataSourceEmpresa(List<EmpresaModel> servidor) {
    dataGridRows = servidor
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'cnpj', value: dataGridRow.cnpj),
              DataGridCell<String>(
                  columnName: 'razaoSocial', value: dataGridRow.razaoSocial),
              DataGridCell<String>(
                  columnName: 'nomeFantasia', value: dataGridRow.nomeFantasia),
              DataGridCell<String>(
                  columnName: 'endereco', value: dataGridRow.endereco),
              DataGridCell<String>(
                  columnName: 'contato', value: dataGridRow.contato),
              DataGridCell<String>(
                  columnName: 'responsavel', value: dataGridRow.responsavel),
              DataGridCell<bool>(
                  columnName: 'filial', value: dataGridRow.filial),
            ]))
        .toList();
  }

  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Text(dataGridCell.value.toString());
    }).toList());
  }
}
