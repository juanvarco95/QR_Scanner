import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class Historial extends StatelessWidget {
  const Historial({Key? key, this.icon}) : super(key: key);
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scan = scanListProvider.scans;

    return ListView.builder(
      itemCount: scan.length,
      itemBuilder: (_, i) => Dismissible(
        key: Key(scan[i].id.toString()),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarById(scan[i].id!);
        },
        child: ListTile(
          leading: Icon(
            this.icon,
            color: Colors.tealAccent,
          ),
          title: Text(scan[i].valor),
          subtitle: Text(scan[i].id.toString()),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () => launchURL(context, scan[i]),
        ),
      ),
    );
  }
}
