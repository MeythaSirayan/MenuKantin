import 'package:flutter/material.dart';

import '../models/menu_kantin.dart';
import '../widgets/teks_kantin.dart';

import 'package:get/get.dart';

class DetailMenu extends StatelessWidget {
  final MenuKantin menu;

  const DetailMenu({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    const ungu = Color(0xFFB39DDB);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB39DDB),
        foregroundColor: Colors.white,
        title: const TeksKantin(
          'Detail Produk',
          ukuran: 20,
          warna: Colors.white,
          ketebalan: FontWeight.bold,
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0EAF9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.fastfood_outlined,
                  size: 50,
                  color: ungu,
                ),
              ),
              const SizedBox(height: 20),
              TeksKantin(
                menu.nama,
                ukuran: 20,
                ketebalan: FontWeight.bold,
                warna: const Color(0xFF6A4C93),
              ),
              const SizedBox(height: 5),
              TeksKantin(
                'Rp ${menu.harga}',
                ukuran: 18,
                ketebalan: FontWeight.bold,
                warna: ungu,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ungu,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Kembali'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
