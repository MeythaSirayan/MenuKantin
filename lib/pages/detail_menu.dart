import 'package:flutter/material.dart';

import '../models/menu_kantin.dart';
import '../widgets/teks_kantin.dart';

class DetailMenu extends StatelessWidget {
  final MenuKantin menu;

  const DetailMenu({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    const ungu = Color(0xFFB39DDB);

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
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
                ukuran: 26,
                ketebalan: FontWeight.bold,
                warna: const Color(0xFF6A4C93),
              ),
              const SizedBox(height: 8),
              TeksKantin(
                'Rp ${menu.harga}',
                ukuran: 22,
                ketebalan: FontWeight.bold,
                warna: ungu,
              ),
              const SizedBox(height: 24),

              if (menu.deskripsi != null && menu.deskripsi!.isNotEmpty) ...[
                const SizedBox(height: 24),
                const TeksKantin(
                  'Deskripsi',
                  ukuran: 18,
                  ketebalan: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                TeksKantin(menu.deskripsi!, ukuran: 15),
              ],
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
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
