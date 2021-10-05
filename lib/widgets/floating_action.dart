import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String scanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        if (scanRes == '-1') {
          return;
        }
        scanListProvider.nuevoScan(scanRes);

        final nuevoScan = await scanListProvider.nuevoScan(scanRes);
        print('Scan Res:  $scanRes');

        launchURL(context, nuevoScan);
      },
      child: Icon(Icons.center_focus_strong),
    );
  }
}
