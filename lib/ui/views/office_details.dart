import 'package:flutter/material.dart';

import '../../core/models/office.dart';

class OfficeDetails extends StatelessWidget {

  final Office office;

  const OfficeDetails({Key? key, required this.office}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            children: [
              for(String key in office.toJson().keys)
                TableRow(
                  children: [
                    Text(key, style: Theme.of(context).textTheme.bodyText2),
                    Text(office.toJson()[key]?.toString() ?? "-", style: Theme.of(context).textTheme.bodyText2)
                  ]
                )
            ],
          ),
        ),
      ),
    );
  }
}
