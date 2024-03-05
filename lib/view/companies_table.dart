import 'package:flutter/material.dart';
import 'package:lxserv/controller/companies_controller.dart';
import 'package:lxserv/model/companies_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataTableFlutter extends StatefulWidget {
  const DataTableFlutter({super.key});

  @override
  State<DataTableFlutter> createState() => _DataTableFlutterState();
}

class _DataTableFlutterState extends State<DataTableFlutter> {
  CompaniesController controller = CompaniesController();
  List<CompaniesModel> companies = [];
  late CompaniesModel model;
  late CompaniesDataSource _companiesDataSource =
      CompaniesDataSource(companies);

  @override
  void initState() {
    super.initState();
    buscarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Hosts e Vms'),
      ),
      body: SfDataGrid(
          source: _companiesDataSource,
          columnWidthMode: ColumnWidthMode.auto,
          allowColumnsResizing: true,
          allowColumnsDragging: true,
          allowFiltering: true,
          allowSorting: true,
          columns: <GridColumn>[
            GridColumn(
                columnName: 'idHost',
                label: const Text(
                  'Virtualizador',
                )),
            GridColumn(
                columnName: 'hostname',
                label: const Text(
                  'HOSTNAME',
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
          ]),
    );
  }

  void buscarDados() async {
    List<CompaniesModel> list = await controller.getCompanies();
    companies = list;
    setState(() {
      _companiesDataSource = CompaniesDataSource(companies);
    });
  }
}

class CompaniesDataSource extends DataGridSource {
  CompaniesDataSource(List<CompaniesModel> companies) {
    dataGridRows = companies
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'idHost', value: dataGridRow.idHost),
              DataGridCell<String>(
                  columnName: 'hostname', value: dataGridRow.hostname),
              DataGridCell<String>(
                  columnName: 'iplan', value: dataGridRow.iplan),
              DataGridCell<String>(
                  columnName: 'ipwan', value: dataGridRow.ipwan),
              DataGridCell<String>(
                  columnName: 'linkWAN', value: dataGridRow.linkWAN),
              DataGridCell<String>(
                  columnName: 'descricao', value: dataGridRow.descricao),
              DataGridCell<int>(columnName: 'cpu', value: dataGridRow.cpu),
              DataGridCell<int>(columnName: 'ram', value: dataGridRow.ram),
              DataGridCell<double>(
                  columnName: 'drive', value: dataGridRow.drive),
              DataGridCell<String>(columnName: 'so', value: dataGridRow.so),
              DataGridCell<String>(
                  columnName: 'licenca', value: dataGridRow.licenca),
              DataGridCell<String>(
                  columnName: 'antivirus', value: dataGridRow.antivirus),
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
