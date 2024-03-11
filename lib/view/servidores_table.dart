import 'package:flutter/material.dart';
import 'package:lxserv/controller/empresa_controller.dart';
import 'package:lxserv/controller/servidor_controller.dart';
import 'package:lxserv/model/servidor_model.dart';
import 'package:lxserv/widgets/dataGridLx.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:lxserv/globals/globals.dart' as globals;

class ServidoresDataTableFlutter extends StatefulWidget {
  const ServidoresDataTableFlutter({super.key});

  @override
  State<ServidoresDataTableFlutter> createState() =>
      _ServidoresDataTableFlutterState();
}

class _ServidoresDataTableFlutterState
    extends State<ServidoresDataTableFlutter> {
  ServidorController servidorController = ServidorController();
  List<ServidorModel> servidores = [];
  late ServidorModel model;
  late CompaniesDataSource _servidoresDataSource =
      CompaniesDataSource(servidores);

  @override
  void initState() {
    super.initState();
    buscarDados();
  }

  @override
  Widget build(BuildContext context) {
    List<GridColumn> colunas = [
      GridColumn(
          columnName: 'idHost',
          label: const Text(
            'Virtualizador',
          )),
      GridColumn(
          columnName: 'host',
          label: const Text(
            'Host',
          )),
      GridColumn(
          columnName: 'hostname',
          label: const Text(
            'HOSTNAME',
          )),
      GridColumn(
          columnName: 'status',
          label: const Text(
            'Status',
          )),
      GridColumn(
          columnName: 'iplan',
          label: const Text(
            'IP - LAN',
          )),
      GridColumn(
          columnName: 'ipwan',
          label: const Text(
            'IP - WAN',
          )),
      GridColumn(
          columnName: 'linkWAN',
          label: const Text(
            'Link WAN',
          )),
      GridColumn(
          columnName: 'descricao',
          label: const Text(
            'Descrição',
          )),
      GridColumn(
          columnName: 'CPU',
          label: const Text(
            'CPU',
          )),
      GridColumn(
          columnName: 'ram',
          label: const Text(
            'RAM',
          )),
      GridColumn(
          columnName: 'drive',
          label: const Text(
            'Drive',
          )),
      GridColumn(
          columnName: 'acessoExterno',
          label: const Text(
            'Acesso Externo',
          )),
      GridColumn(
          columnName: 'so',
          label: const Text(
            'Sistema Operacional',
          )),
      GridColumn(
          columnName: 'Licença',
          label: const Text(
            'licenca',
          )),
      GridColumn(
          columnName: 'antivirus',
          label: const Text(
            'Antivirus',
          )),
      GridColumn(
          columnName: 'backup',
          label: const Text(
            'backup',
          )),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Listagem de Hosts e Vms',
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          child: WidgetSfDataGrid(
              servidoresDataSource: _servidoresDataSource, colunas: colunas)),
    );
  }

  void buscarDados() async {
    List<ServidorModel> list =
        await servidorController.getServidoresCnpj("13505252000114");
    servidores = list;
    EmpresaController controller = EmpresaController();
    globals.empresas = await controller.getEmpresas();
    setState(() {
      _servidoresDataSource = CompaniesDataSource(servidores);
    });
  }
}

class CompaniesDataSource extends DataGridSource {
  CompaniesDataSource(List<ServidorModel> servidor) {
    dataGridRows = servidor
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'idHost', value: dataGridRow.idHost),
              DataGridCell<String>(
                  columnName: 'host', value: dataGridRow.host ? "Host" : "VM"),
              DataGridCell<String>(
                  columnName: 'hostname', value: dataGridRow.hostname),
              DataGridCell<String>(
                  columnName: 'status', value: dataGridRow.status),
              DataGridCell<String>(
                  columnName: 'iplan', value: dataGridRow.iplan),
              DataGridCell<String>(
                  columnName: 'ipwan', value: dataGridRow.ipwan),
              DataGridCell<String>(
                  columnName: 'linkWAN', value: dataGridRow.linkWAN),
              DataGridCell<String>(
                  columnName: 'descricao', value: dataGridRow.descricao),
              DataGridCell<int>(columnName: 'cpu', value: dataGridRow.cpu),
              DataGridCell<String>(
                  columnName: 'ram', value: "${dataGridRow.ram}GB"),
              DataGridCell<String>(
                  columnName: 'drive', value: "${dataGridRow.drive}GB"),
              DataGridCell<String>(
                  columnName: 'acessoExterno',
                  value: dataGridRow.acessoExterno),
              DataGridCell<String>(columnName: 'so', value: dataGridRow.so),
              DataGridCell<String>(
                  columnName: 'licenca', value: dataGridRow.licenca),
              DataGridCell<String>(
                columnName: 'antivirus',
                value: dataGridRow.antivirus,
              ),
              DataGridCell<String>(
                columnName: 'backup',
                value: dataGridRow.backup,
              ),
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
