import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scan = scanListProvider.scans;

    return Scaffold(
        body: ListView.builder(
      itemCount: scan.length,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(
          Icons.account_balance_wallet_rounded,
          color: Colors.tealAccent,
        ),
        title: Text(scan[i].valor),
        subtitle: Text(scan[i].id.toString()),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
        onTap: () {
          print(scan[i].id);
        },
      ),
    ));
  }
}
