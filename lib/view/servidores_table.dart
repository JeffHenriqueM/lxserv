import 'package:flutter/material.dart';
import 'package:lxserv/controller/servidor_controller.dart';
import 'package:lxserv/model/servidor_model.dart';
import 'package:lxserv/widgets/app_bar.dart';
import 'package:lxserv/widgets/data_grid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/services.dart';

class ServidoresDataTableFlutter extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ServidoresDataTableFlutter({super.key, cnpj}) : _cnpj = cnpj;
  final String _cnpj;

  @override
  State<ServidoresDataTableFlutter> createState() =>
      _ServidoresDataTableFlutterState();
}

class _ServidoresDataTableFlutterState
    extends State<ServidoresDataTableFlutter> {
  ServidorController servidorController = ServidorController();
  List<ServidorModel> servidores = [];
  late ServidorModel model;
  late DataSourceServidor _servidoresDataSource =
      DataSourceServidor(servidores);
  final DataGridController _dataGridController = DataGridController();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    buscarDados(widget._cnpj);
  }

  @override
  Widget build(BuildContext context) {
    List<GridColumn> colunas = [
      GridColumn(
          columnName: 'idCompany',
          label: const Text(
            'CNPJ Empresa',
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
          columnName: 'acessoExterno',
          label: const Text(
            'Acesso Externo',
          )),
      GridColumn(
          columnName: 'descricao',
          label: const Text(
            'Descrição',
          )),
      GridColumn(
          columnName: 'so',
          label: const Text(
            'Sistema Operacional',
          )),
      GridColumn(
          columnName: 'host',
          label: const Text(
            'Host',
          )),
      GridColumn(
          columnName: 'idHost',
          label: const Text(
            'Virtualizador',
          )),
      GridColumn(
          columnName: 'status',
          label: const Text(
            'Status',
          )),
      GridColumn(
          columnName: 'ipwan',
          label: const Text(
            'IP - WAN',
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
      GridColumn(
          columnName: 'linkWAN',
          label: const Text(
            'Link WAN',
          )),
    ];

    return Scaffold(
        appBar: const AppBarLx(
          title: "Listagem de Hosts e Vms",
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Row(
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
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        cursorColor: Colors.green,
                        textAlign: TextAlign.center,
                        controller: controller,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _servidoresDataSource.addFilter(
                              'hostname',
                              FilterCondition(
                                value: controller.text,
                                type: FilterType.contains,
                                filterBehavior: FilterBehavior.stringDataType,
                              ));
                        },
                        icon: const Icon(Icons.search)),
                  ],
                ),
                Expanded(
                  child: WidgetSfDataGridServidor(
                      controller: _dataGridController,
                      dataSource: _servidoresDataSource,
                      colunas: colunas),
                ),
              ],
            );
            //if (constraints.maxWidth > 600) {}
          },
        ));
  }

  void buscarDados(String cnpj) async {
    List<ServidorModel> list;
    if (cnpj == "") {
      list = await servidorController.getServidoresCnpj(null);
    } else {
      list = await servidorController.getServidoresCnpj(cnpj);
    }
    servidores = list;
    setState(() {
      _servidoresDataSource = DataSourceServidor(servidores);
    });
  }
}

class DataSourceServidor extends DataGridSource {
  DataSourceServidor(List<ServidorModel> servidor) {
    dataGridRows = servidor
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'idCompany', value: dataGridRow.idCompany),
              DataGridCell<String>(
                  columnName: 'hostname', value: dataGridRow.hostname),
              DataGridCell<String>(
                  columnName: 'iplan', value: dataGridRow.iplan),
              DataGridCell<String>(
                  columnName: 'acessoExterno',
                  value: dataGridRow.acessoExterno),
              DataGridCell<String>(
                  columnName: 'descricao', value: dataGridRow.descricao),
              DataGridCell<String>(columnName: 'so', value: dataGridRow.so),
              DataGridCell<String>(
                  columnName: 'host', value: dataGridRow.host ? "Host" : "VM"),
              DataGridCell<String>(
                  columnName: 'idHost', value: dataGridRow.idHost),
              DataGridCell<String>(
                  columnName: 'status', value: dataGridRow.status),
              DataGridCell<String>(
                  columnName: 'ipwan', value: dataGridRow.ipwan),
              DataGridCell<int>(columnName: 'cpu', value: dataGridRow.cpu),
              DataGridCell<String>(
                  columnName: 'ram', value: "${dataGridRow.ram}GB"),
              DataGridCell<String>(
                  columnName: 'drive', value: "${dataGridRow.drive}GB"),
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
              DataGridCell<String>(
                  columnName: 'linkWAN', value: dataGridRow.linkWAN),
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
