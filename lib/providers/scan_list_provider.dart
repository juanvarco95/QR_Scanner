import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(nuevoScan);
    nuevoScan.id = id;

    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScanByTipo(String tipo) async {
    final scans = await DBProvider.db.getScanByTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  borrarById(int id) async {
    await DBProvider.db.deleteScan(id);
    this.cargarScanByTipo(this.tipoSeleccionado);
  }
}
