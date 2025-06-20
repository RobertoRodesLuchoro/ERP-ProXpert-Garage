import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkshopHomeWidget extends StatelessWidget {
  const WorkshopHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat.yMMMMEEEEd('es_ES').format(DateTime.now());
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1C1F2E) : const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(10),
        border: isDark ? null : Border.all(color: Colors.black, width: 0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🔧 Resumen de actividad diaria:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text('• 5 vehículos pendientes', style: Theme.of(context).textTheme.bodyMedium),
          Text('• 3 presupuestos por aprobar', style: Theme.of(context).textTheme.bodyMedium),
          Text('• 2 citas agendadas', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text('⏱ Tiempo medio de reparación: 2 días', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text('🛠 Productos más usados hoy:', style: Theme.of(context).textTheme.bodyMedium),
          Text('• Aceite 10W-40 (x5)', style: Theme.of(context).textTheme.bodyMedium),
          Text('• Filtro de aire (x3)', style: Theme.of(context).textTheme.bodyMedium),
          Text('• Líquido anticongelante (x5)', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text('📦 Avisos de inventario:', style: Theme.of(context).textTheme.bodyMedium),
          Text('• Batería 70Ah: solo 10 uds.', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text('👨‍🔧 Mecánicos en turno:', style: Theme.of(context).textTheme.bodyMedium),
          Text('• Pedro L. (3 tareas)', style: Theme.of(context).textTheme.bodyMedium),
          Text('• Marta V. (2 tareas)', style: Theme.of(context).textTheme.bodyMedium),
          Text('• J. R. García Sevilla (2 tareas)', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text('⏳ Órdenes que terminan hoy:', style: Theme.of(context).textTheme.bodyMedium),
          Text('• PR-104 (Ana Martínez)', style: Theme.of(context).textTheme.bodyMedium),
          const Divider(height: 24),
          Text(
            'ProXpert Garage',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'ERP de gestión de talleres mecánicos',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 4),
          Text(
            '📅 $formattedDate',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}