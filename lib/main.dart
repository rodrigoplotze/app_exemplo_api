import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/estados_view.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EstadosView(),
    );
  }
}
