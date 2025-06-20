import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/TotalWorkOrderTable.dart';
import 'components/WorkOrderTable.dart';
import 'components/header.dart';

class WorkOrderScreen extends StatelessWidget {
  const WorkOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Header(title: "Órdenes de Trabajo"),
          SizedBox(height: defaultPadding),
          TotalWorkOrderTable(),
        ],
      ),
    );
  }
}
