import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../models/product.dart';
import '../services/ProductoService.dart';

class ProductoTable extends StatefulWidget {
  const ProductoTable({Key? key}) : super(key: key);

  @override
  State<ProductoTable> createState() => _ProductoTableState();
}

class _ProductoTableState extends State<ProductoTable> {
  late Future<List<Producto>> _futureProductos;

  @override
  void initState() {
    super.initState();
    _futureProductos = ProductoService.getMostRecent(4);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Productos en Inventario",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: defaultPadding),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: isDark ? secondaryColor : const Color(0xFFFAFAFA),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: isDark
                ? null
                : Border.all(color: Colors.black, width: 0.2),
          ),
          child: SizedBox(
            width: double.infinity,
            child: FutureBuilder<List<Producto>>(
              future: _futureProductos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No hay productos disponibles."));
                }

                final productos = snapshot.data!;

                return DataTable(
                  columnSpacing: defaultPadding,
                  columns: const [
                    DataColumn(label: Text("ID")),
                    DataColumn(label: Text("Nombre")),
                    DataColumn(label: Text("Categoría")),
                    DataColumn(label: Text("Precio (€)")),
                    DataColumn(label: Text("Cantidad")),
                  ],
                  rows: productos
                      .map((producto) => _buildDataRow(producto, isDark))
                      .toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  DataRow _buildDataRow(Producto producto, bool isDark) {
    final style = TextStyle(color: isDark ? Colors.white : Colors.black);
    return DataRow(
      cells: [
        DataCell(Text(producto.id?.toString() ?? "-", style: style)),
        DataCell(Text(producto.nombre, style: style)),
        DataCell(Text(producto.categoria, style: style)),
        DataCell(Text("${producto.precio.toStringAsFixed(2)}", style: style)),
        DataCell(Text(producto.cantidad.toString(), style: style)),
      ],
    );
  }
}

