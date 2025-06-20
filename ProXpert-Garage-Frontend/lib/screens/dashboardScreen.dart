import 'package:flutter/cupertino.dart';

import '../constants.dart';
import '../responsive.dart';
import 'components/ProductoTable.dart';
import 'components/WorkOrderTable.dart';
import 'components/WorkshopHomeWidget.dart';
import 'components/budgets.dart';
import 'components/financialBalance.dart';
import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: "Dashboard"),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Budgets(),
                      SizedBox(height: defaultPadding),
                      WorkOrderTable(),
                      SizedBox(height: defaultPadding),
                      ProductoTable(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        FinancialBalance(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        FinancialBalance(),
                        SizedBox(height: defaultPadding),
                        WorkshopHomeWidget(),
                      ],
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}