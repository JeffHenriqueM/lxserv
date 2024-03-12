import 'package:lxserv/view/servidores_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class WidgetSfDataGrid extends StatelessWidget {
  const WidgetSfDataGrid({
    super.key,
    required CompaniesDataSource servidoresDataSource,
    required List<GridColumn> colunas,
  })  : _servidoresDataSource = servidoresDataSource,
        _colunas = colunas;

  final CompaniesDataSource _servidoresDataSource;
  final List<GridColumn> _colunas;

  @override
  Widget build(BuildContext context) {
    return DataGridLx(
      servidoresDataSource: _servidoresDataSource,
      colunas: _colunas,
    );
  }
}

class DataGridLx extends StatelessWidget {
  const DataGridLx({
    super.key,
    required CompaniesDataSource servidoresDataSource,
    required List<GridColumn> colunas,
  })  : _servidoresDataSource = servidoresDataSource,
        _colunas = colunas;

  final CompaniesDataSource _servidoresDataSource;
  final List<GridColumn> _colunas;

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
        source: _servidoresDataSource,
        columnWidthMode: ColumnWidthMode.auto,
        allowColumnsResizing: true,
        allowColumnsDragging: true,
        allowFiltering: true,
        allowSorting: true,
        columns: _colunas);
  }
}
