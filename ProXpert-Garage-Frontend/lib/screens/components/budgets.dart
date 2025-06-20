import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/budget.dart';
import '../../responsive.dart';
import '../services/PresupuestoService.dart';
import 'budgetGridView.dart';
import 'budgetInfoCard.dart';

class Budgets extends StatefulWidget {
  const Budgets({Key? key}) : super(key: key);

  @override
  State<Budgets> createState() => _BudgetsState();
}

class _BudgetsState extends State<Budgets> {
  late Future<List<BudgetInfo>> _futureBudgets;

  @override
  void initState() {
    super.initState();
    _futureBudgets = PresupuestoService.getMostRecent(4);
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Presupuestos Recientes",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        FutureBuilder<List<BudgetInfo>>(
          future: _futureBudgets,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text("No hay presupuestos disponibles.");
            }

            final budgets = snapshot.data!;
            return Responsive(
              mobile: FileInfoCardGridView(
                budgets: budgets,
                crossAxisCount: _size.width < 650 ? 2 : 4,
                childAspectRatio: _size.width < 650 ? 1.3 : 1,
              ),
              tablet: FileInfoCardGridView(budgets: budgets),
              desktop: FileInfoCardGridView(
                budgets: budgets,
                childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
              ),
            );
          },
        ),
      ],
    );
  }
}