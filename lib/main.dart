import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/daftar_menu.dart';

void main() {
  runApp(const AplikasiKantin());
}

class AplikasiKantin extends StatelessWidget {
  const AplikasiKantin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Kantin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB39DDB)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F5FC),
      ),
      home: const DaftarMenu(),
    );
  }
}
