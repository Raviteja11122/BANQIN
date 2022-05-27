import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../core/models/office.dart';
import '../../../core/view_models/offices_view_model.dart';

class OfficesDesktop extends ViewModelWidget<OfficesViewModel>{
  const OfficesDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, OfficesViewModel viewModel) {
    return Visibility(
      visible: !viewModel.isBusy,
      replacement: const Center(child: CircularProgressIndicator(color: Colors.white)),
      child: viewModel.offices.isEmpty
        ? const Text("No Results Found")
        : Theme(
            data: ThemeData.light(),
            child: SingleChildScrollView(
              child: AdvancedPaginatedDataTable(
                addEmptyRows: false,
                source: ExampleSource(offices: viewModel.offices),
                showFirstLastButtons: true,
                rowsPerPage: 10,
                columns: const [
                  DataColumn(label: Text('Office Name')),
                  DataColumn(label: Text('External Id')),
                  DataColumn(label: Text('Parent Office Name')),
                  DataColumn(label: Text('Opened Date')),
                ],
              ),
            ),
          ),
    );
  }
}

class ExampleSource extends AdvancedDataTableSource<Office> {

  final List<Office> _offices;

  ExampleSource({required List<Office> offices}): _offices = offices;

  @override
  DataRow? getRow(int index) {
    final currentRowData = lastDetails!.rows[index];
      return DataRow(
        cells: [
          DataCell(
            Text(currentRowData.name),
          ),
          DataCell(
            Text(currentRowData.externalId ?? "-"),
          ),
          DataCell(
            Text(currentRowData.parentName ?? "-"),
          ),
          DataCell(
            Text(currentRowData.openingDate.reversed.join("-")),
          )
        ]
      );
  }

  @override
  int get selectedRowCount => 0;

  @override
  Future<RemoteDataSourceDetails<Office>> getNextPage(
      NextPageRequest pageRequest) async {
    return RemoteDataSourceDetails(
      _offices.length,
      _offices
          .skip(pageRequest.offset)
          .take(pageRequest.pageSize)
          .toList(), //again in a real world example you would only get the right amount of rows
    );
  }
}
