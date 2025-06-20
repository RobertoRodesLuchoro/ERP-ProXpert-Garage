import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/workOrder.dart';
import '../WorkOrderDetailScreen.dart';
import '../mainScreen.dart';
import '../../constants.dart';
import '../services/WorkOrderService.dart';
import '../CreateOrderWorkScreen.dart';

class TotalWorkOrderTable extends StatefulWidget {
  const TotalWorkOrderTable({super.key});

  @override
  State<TotalWorkOrderTable> createState() => _TotalWorkOrderTableState();
}

class _TotalWorkOrderTableState extends State<TotalWorkOrderTable> {
  late Future<List<WorkOrderInfo>> futureWorkOrders;
  List<WorkOrderInfo> workOrders = [];
  final Set<int> selectedIds = {};

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() {
    futureWorkOrders = OrdenTrabajoService.getAll();
    futureWorkOrders.then((data) {
      setState(() {
        workOrders = data;
      });
    });
  }

  bool get allSelected => selectedIds.length == workOrders.length;

  void toggleSelectAll(bool? value) {
    setState(() {
      if (value == true) {
        selectedIds.addAll(workOrders.map((wo) => wo.id!));
      } else {
        selectedIds.clear();
      }
    });
  }

  void toggleSelect(int id) {
    setState(() {
      if (selectedIds.contains(id)) {
        selectedIds.remove(id);
      } else {
        selectedIds.add(id);
      }
    });
  }

  void deleteSelected() async {
    final List<int> idsToDelete = selectedIds.toList();

    for (final id in idsToDelete) {
      final success = await OrdenTrabajoService.delete(id);
      if (success) {
        workOrders.removeWhere((wo) => wo.id == id);
      } else {
        debugPrint("❌ Error al eliminar orden con ID $id");
      }
    }

    setState(() {
      selectedIds.clear();
    });
  }



  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateOrderWork()),
                );
                _cargarDatos(); // ← 🔁 Recargar después de volver
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Añadir"),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => _mostrarConfirmacionEliminacion(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Eliminar"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: isDark ? secondaryColor : const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(10),
            border: isDark ? null : Border.all(color: Colors.black.withOpacity(0.2)),
          ),
          child: FutureBuilder<List<WorkOrderInfo>>(
            future: futureWorkOrders,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }

              return SizedBox(
                width: double.infinity,
                child: DataTable(
                  columnSpacing: defaultPadding,
                  showCheckboxColumn: false,
                  columns: const [
                    DataColumn(label: SizedBox(width: 30, child: Center(child: Text("")))),
                    DataColumn(label: Text("ID")),
                    DataColumn(label: Text("Cliente")),
                    DataColumn(label: Text("Vehículo")),
                    DataColumn(label: Text("Matrícula")),
                    DataColumn(label: Text("Estado")),
                    DataColumn(label: Text("Inicio")),
                    DataColumn(label: Text("Fin")),
                    DataColumn(label: Text("Importe (€)")),
                    DataColumn(label: Text("")),
                  ],
                  rows: workOrders.map((order) {
                    final bool selected = selectedIds.contains(order.id);
                    return DataRow(
                      selected: selected,
                      cells: [
                        DataCell(
                          Checkbox(
                            value: selected,
                            onChanged: (_) => toggleSelect(order.id!),
                          ),
                        ),
                        DataCell(Text(order.id.toString())),
                        DataCell(Text(order.cliente ?? "-")),
                        DataCell(Text(order.vehiculo ?? "-")),
                        DataCell(Text(order.matricula ?? "-")),
                        DataCell(Text(order.estado ?? "-")),
                        DataCell(Text(DateFormat('yyyy-MM-dd').format(order.fechaInicio!))),
                        DataCell(Text(order.fechaFin != null
                            ? DateFormat('yyyy-MM-dd').format(order.fechaFin!)
                            : "-")),
                        DataCell(Text(order.totalOrdenTrabajo?.toStringAsFixed(2) ?? "-")),
                        DataCell(
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MainScreen(child: DetailOrderWork(orderId: order.id!)),
                                ),
                              );
                            },
                            child: const Text("Ver detalles", style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _mostrarConfirmacionEliminacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text("Confirmar eliminación"),
        content: const Text("¿Estás seguro de que deseas eliminar las órdenes seleccionadas?\n\nEsta acción no se puede deshacer."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            onPressed: () {
              deleteSelected();
              Navigator.of(context).pop();
            },
            child: const Text("Eliminar"),
          ),
        ],
      ),
    );
  }
}

