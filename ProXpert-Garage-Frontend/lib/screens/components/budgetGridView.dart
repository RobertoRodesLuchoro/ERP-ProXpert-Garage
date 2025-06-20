
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/budget.dart';
import 'budgetInfoCard.dart';

class FileInfoCardGridView extends StatelessWidget {
  final List<BudgetInfo> budgets;
  final int crossAxisCount;
  final double childAspectRatio;

  const FileInfoCardGridView({
    Key? key,
    required this.budgets,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: budgets.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          BudgetInfoCard(info: budgets[index]),
    );
  }
}
