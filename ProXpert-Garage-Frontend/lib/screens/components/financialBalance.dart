import 'package:flutter/material.dart';
import '../../constants.dart';
import 'chart.dart';
import 'costsInfoCard.dart';

class FinancialBalance extends StatelessWidget {
  const FinancialBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: isDark ? secondaryColor : const Color(0xFFFAFAFA),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: isDark
            ? null
            : Border.all(
          color: Colors.black,
          width: 0.2, // ajusta el grosor si quieres
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Balance Financiero",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Chart(isDark: isDark),
          CostsInfoCard(
            svgSrc: "assets/icons/iconoDocumento.svg",
            title: "Ingresos por Órdenes de Trabajo",
            costsOfStuff: "+14.999,99€",
            numOfStuff: "150 Órdenes de Trabajo",
            isDark: isDark,
            // No se pasa iconColor => usa color por defecto del icono
          ),
          CostsInfoCard(
            svgSrc: "assets/icons/drop_box.svg",
            title: "Costes de Compra de Productos",
            costsOfStuff: "-2.469,87€",
            numOfStuff: "324 Productos Comprados",
            isDark: isDark,
            iconColor: Colors.red,
          ),

        ],
      ),
    );
  }
}

