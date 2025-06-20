import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/workOrder.dart';

import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../models/workOrder.dart';
import '../services/WorkOrderService.dart';

class WorkOrderTable extends StatefulWidget {
  const WorkOrderTable({Key? key}) : super(key: key);

  @override
  State<WorkOrderTable> createState() => _WorkOrderTableState();
}

class _WorkOrderTableState extends State<WorkOrderTable> {
  late Future<List<WorkOrderInfo>> _futureWorkOrders;

  @override
  void initState() {
    super.initState();
    _futureWorkOrders = OrdenTrabajoService.getMostRecent(4);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Órdenes de Trabajo Recientes",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[900] : const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(10),
            border: isDark
                ? null
                : Border.all(color: Colors.black.withOpacity(0.2)),
          ),
          child: FutureBuilder<List<WorkOrderInfo>>(
            future: _futureWorkOrders,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text("No hay órdenes de trabajo.");
              }

              final workOrders = snapshot.data!;

              return SizedBox(
                width: double.infinity,
                child: DataTable(
                  columnSpacing: 16,
                  columns: const [
                    DataColumn(label: Text("ID")),
                    DataColumn(label: Text("Cliente")),
                    DataColumn(label: Text("Vehículo")),
                    DataColumn(label: Text("Matrícula")),
                    DataColumn(label: Text("Estado")),
                    DataColumn(label: Text("Inicio")),
                    DataColumn(label: Text("Fin")),
                    DataColumn(label: Text("Importe (€)")),
                  ],
                  rows: workOrders
                      .map((order) => _buildDataRow(order, isDark))
                      .toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  DataRow _buildDataRow(WorkOrderInfo order, bool isDark) {
    final textStyle = TextStyle(color: isDark ? Colors.white : Colors.black);

    return DataRow(
      cells: [
        DataCell(Text(order.id.toString(), style: textStyle)),
        DataCell(Text(order.cliente ?? "-", style: textStyle)),
        DataCell(Text(order.vehiculo ?? "-", style: textStyle)),
        DataCell(Text(order.matricula ?? "-", style: textStyle)),
        DataCell(
          Text(
            order.estado ?? "-",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _getEstadoColor(order.estado),
            ),
          ),
        ),
        DataCell(Text(_formatDate(order.fechaInicio), style: textStyle)),
        DataCell(Text(_formatDate(order.fechaFin), style: textStyle)),
        DataCell(Text("${order.totalOrdenTrabajo?.toStringAsFixed(2)} €", style: textStyle)),
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "-";
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Color _getEstadoColor(String? estado) {
    switch (estado?.toLowerCase()) {
      case 'en curso':
        return Colors.amberAccent.shade200;
      case 'completada':
        return Colors.greenAccent.shade400;
      case 'cancelada':
        return Colors.redAccent.shade200;
      case 'pendiente':
        return Colors.deepOrangeAccent.shade200;
      default:
        return Colors.grey;
    }
  }
}



