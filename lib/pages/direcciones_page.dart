import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Historial(
      icon: Icons.manage_search_sharp,
    );
  }
}
