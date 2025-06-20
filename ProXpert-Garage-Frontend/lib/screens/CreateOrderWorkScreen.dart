import 'package:flutter/material.dart';
import 'package:proxpert_garage_frontend/screens/WorkOrderScreen.dart';
import 'package:proxpert_garage_frontend/screens/mainScreen.dart';
import 'package:proxpert_garage_frontend/screens/services/WorkOrderService.dart';

import '../constants.dart';
import 'components/header.dart';

class CreateOrderWork extends StatefulWidget {
  const CreateOrderWork({super.key});

  @override
  State<CreateOrderWork> createState() => _CreateOrderWorkState();
}

class _CreateOrderWorkState extends State<CreateOrderWork> {
  final TextEditingController clienteController = TextEditingController();
  final TextEditingController vehiculoController = TextEditingController();
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController fechaEntradaController = TextEditingController();
  final TextEditingController fechaFinController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(title: "Crear Orden de Trabajo"),
            const SizedBox(height: defaultPadding),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MainScreen(child: const WorkOrderScreen()),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Atrás'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent[700],
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  _buildCampo('Cliente', clienteController),
                                  _buildCampo('Vehículo', vehiculoController),
                                  _buildCampo('Matrícula', matriculaController),
                                  _buildCampo('Estado', estadoController),
                                ],
                              ),
                            ),
                            const SizedBox(width: 48),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  _buildCampo('Fecha entrada', fechaEntradaController),
                                  _buildCampo('Fecha fin', fechaFinController),
                                  _buildCampo('Total (€)', totalController),
                                  const SizedBox(height: 32),
                                  ElevatedButton.icon(
                                    onPressed: _createOrdenTrabajo,
                                    icon: const Icon(Icons.save),
                                    label: const Text('Guardar'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.tealAccent[700],
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampo(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor ?? Theme.of(context).cardColor,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _createOrdenTrabajo() async {
    final cliente = clienteController.text.trim();
    final vehiculo = vehiculoController.text.trim();
    final matricula = matriculaController.text.trim();
    final estado = estadoController.text.trim();
    final fechaInicio = _parseDate(fechaEntradaController.text);
    final fechaFin = _parseDate(fechaFinController.text);
    final total = double.tryParse(totalController.text.replaceAll(',', '.')) ?? 0.0;

    if ([cliente, vehiculo, matricula, estado].any((v) => v.isEmpty) || fechaInicio == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Campos incompletos'),
          content: const Text('Por favor, completa todos los campos correctamente.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
      return;
    }

    final orden = {
      "cliente": cliente,
      "vehiculo": vehiculo,
      "matricula": matricula,
      "fechaInicio": fechaInicio,
      "fechaFin": fechaFin,
      "estado": estado,
      "precioTotal": total
    };

    final success = await OrdenTrabajoService.create(orden);

    if (success != null) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Orden creada', style: TextStyle(color: Colors.green)),
          content: const Text('La orden se ha añadido correctamente.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => MainScreen(child: const WorkOrderScreen())),
            (Route<dynamic> route) => false,
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('No se pudo crear la orden.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    }
  }

  String? _parseDate(String input) {
    try {
      final parts = input.split('/');
      return "${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}";
    } catch (_) {
      return null;
    }
  }
}
