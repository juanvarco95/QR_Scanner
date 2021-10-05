import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/mapas_page.dart';

import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UiProvider()),
          ChangeNotifierProvider(create: (_) => ScanListProvider()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: 'home',
            routes: {
              'home': (_) => HomePage(),
              'mapasweb': (_) => MapasPage(),
            },
            //   theme: ThemeData(
            //       primaryColor: Colors.limeAccent,
            //       backgroundColor: Colors.black,
            //       fontFamily: 'Consolas',
            //       brightness: Brightness.dark,
            //       bottomAppBarColor: Colors.lime),
            // ),
            theme: ThemeData.dark().copyWith(
                appBarTheme: AppBarTheme(color: Colors.indigoAccent))));
  }
}
