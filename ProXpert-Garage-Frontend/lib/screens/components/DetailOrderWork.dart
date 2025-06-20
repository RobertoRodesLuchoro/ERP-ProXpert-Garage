import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class DetailOrderWork extends StatefulWidget {
  const DetailOrderWork({super.key});

  @override
  State<DetailOrderWork> createState() => _DetailOrderWorkState();
}

class _DetailOrderWorkState extends State<DetailOrderWork> {
  final TextEditingController clienteController =
  TextEditingController(text: 'Juan Pérez');
  final TextEditingController vehiculoController =
  TextEditingController(text: 'Peugeot 308 - 2018');
  final TextEditingController matriculaController =
  TextEditingController(text: '1234-ABC');
  final TextEditingController estadoController =
  TextEditingController(text: 'En reparación');
  final TextEditingController fechaEntradaController =
  TextEditingController(text: '13/06/2025');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 800, // antes estaba en 600
          maxHeight: 500, // más alto que antes
        ),
        child: Card(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(32), // más margen interno
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Editar Orden de Trabajo',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                _buildCampo('Cliente', clienteController),
                _buildCampo('Vehículo', vehiculoController),
                _buildCampo('Matrícula', matriculaController),
                _buildCampo('Estado', estadoController),
                _buildCampo('Fecha entrada', fechaEntradaController),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // guardar cambios
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent[700],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor ??
                    Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
