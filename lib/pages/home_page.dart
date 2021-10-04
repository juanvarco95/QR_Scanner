import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

import 'package:qr_scanner/widgets/widgets.dart';

import 'mapa_page.dart';
// import 'package:sqflite/sqflite.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              scanListProvider.borrarTodos();
            },
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    // final tempScan = ScanModel(valor: 'http://google.com');
    // DBProvider.db.initDB();
    // DBProvider.db.newScan(tempScan);
    // DBProvider.db.getAllScanById().then((value) => print(value));
    // DBProvider.db.getScanById(5).then((value) => print(value!.valor));
    // DBProvider.db.deleteAllScan().then((value) => print(value));

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanByTipo('geo');
        return MapaPage();
      case 1:
        scanListProvider.cargarScanByTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
