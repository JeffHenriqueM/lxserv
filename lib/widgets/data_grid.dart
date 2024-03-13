import 'package:lxserv/view/empresa_table.dart';
import 'package:lxserv/view/servidores_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class WidgetSfDataGrid extends StatelessWidget {
  const WidgetSfDataGrid({
    super.key,
    required DataSourceEmpresa dataSource,
    required List<GridColumn> colunas,
    required DataGridController controller,
  })  : _dataSource = dataSource,
        _colunas = colunas,
        _dataGridController = controller;

  final DataSourceEmpresa _dataSource;
  final List<GridColumn> _colunas;
  final DataGridController _dataGridController;

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
        source: _dataSource,
        columnWidthMode: ColumnWidthMode.fill,
        allowFiltering: true,
        allowSorting: true,
        selectionMode: SelectionMode.single,
        navigationMode: GridNavigationMode.cell,
        controller: _dataGridController,
        columns: _colunas);
  }
}

class WidgetSfDataGridServidor extends StatelessWidget {
  const WidgetSfDataGridServidor({
    super.key,
    required DataSourceServidor dataSource,
    required List<GridColumn> colunas,
    required DataGridController controller,
  })  : _dataSource = dataSource,
        _colunas = colunas,
        _dataGridController = controller;

  final DataSourceServidor _dataSource;
  final List<GridColumn> _colunas;
  final DataGridController _dataGridController;

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
        source: _dataSource,
        columnWidthMode: ColumnWidthMode.auto,
        allowFiltering: true,
        allowSorting: true,
        selectionMode: SelectionMode.single,
        navigationMode: GridNavigationMode.cell,
        controller: _dataGridController,
        columns: _colunas);
  }
}
