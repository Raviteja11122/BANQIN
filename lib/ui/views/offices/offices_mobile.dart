import 'package:bank_genie_task/core/view_models/offices_view_model.dart';
import 'package:bank_genie_task/ui/views/office_details.dart' as od;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OfficesMobileView extends ViewModelWidget<OfficesViewModel> {

  const OfficesMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, OfficesViewModel viewModel) {
    return SafeArea(
      child: Visibility(
        visible: !viewModel.isBusy,
        replacement: const Center(child: CircularProgressIndicator(color: Colors.white)),
        child: viewModel.offices.isEmpty
          ? const Text("No Results Found")
          : ListView.separated(
            itemBuilder: (context, index) => ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => od.OfficeDetails(office: viewModel.offices[index]))),
              title: Text(viewModel.offices[index].name),
              subtitle: Text(viewModel.offices[index].openingDate.reversed.join("-")),
            ),
            separatorBuilder: (context, index) => const Divider(thickness: 1.5, color: Colors.white),
            itemCount: viewModel.offices.length
        ),
      ),
    );
  }

}
