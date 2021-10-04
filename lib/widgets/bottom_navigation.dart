import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int i) {
          uiProvider.selectedMenuOpt = i;
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph_sharp,
              ),
              label: 'Direcciones')
        ]);
  }
}
