import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../models/budget.dart';

class BudgetInfoCard extends StatelessWidget {
  const BudgetInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final BudgetInfo info;

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
          width: 0.2,
        ),
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.75),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: info.color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset(
                    info.svgSrc!,
                    colorFilter: ColorFilter.mode(
                      info.color ?? Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Icon(Icons.more_vert,
                    color: isDark ? Colors.white54 : Colors.black54),
              ],
            ),
            Text(
              "#${info.id.toString()} Presupuesto",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 18,
              ),
            ),
            ProgressLine(
              color: info.color,
              percentage: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cliente: ${info.nombreCliente}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: isDark ? Colors.white : Colors.black87,
                    fontSize: 14, // ← más grande
                  ),
                ),
                Text(
                  "Vehículo: ${info.matriculaVehiculo}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 14, // ← más grande
                  ),
                ),
                Text(
                  "Fecha: ${info.fechaPresupuesto?.year}-${info.fechaPresupuesto?.month.toString().padLeft(2, '0')}-${info.fechaPresupuesto?.day.toString().padLeft(2, '0')}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 14, // ← más grande
                  ),
                ),
                Text(
                  "Precio Total: ${info.totalPresupuesto}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 14, // ← más grande
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}