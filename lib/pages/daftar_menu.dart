import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu_kantin.dart';
import '../widgets/teks_kantin.dart';
import 'detail_menu.dart';
import 'tambah_menu.dart';

class DaftarMenu extends StatefulWidget {
  const DaftarMenu({super.key});

  @override
  State<DaftarMenu> createState() => _DaftarMenuState();
}

class _DaftarMenuState extends State<DaftarMenu> {
  final List<MenuKantin> daftarMenu = [
    const MenuKantin(nama: 'Beef Burger', harga: 20000),
    const MenuKantin(nama: 'Chicken Katsu', harga: 20000),
    const MenuKantin(nama: 'French Fries', harga: 20000),
    const MenuKantin(nama: 'Croffle', harga: 14000),
    const MenuKantin(nama: 'Matcha Latte', harga: 16000),
  ];

  Future<void> bukaTambahMenu() async {
    final MenuKantin? hasil = await Get.to<MenuKantin>(
      () => const TambahMenu(),
    );

    if (!mounted) return;

    if (hasil != null) {
      setState(() {
        daftarMenu.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB39DDB),
        foregroundColor: Colors.white,
        title: const TeksKantin(
          'Kantin',
          ukuran: 20,
          warna: Colors.white,
          ketebalan: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: const TeksKantin(
              'Pilih menu makanan atau minuman favoritmu!',
              ukuran: 14,
              warna: Color(0xFF777080),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final MenuKantin menu = daftarMenu[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  elevation: 1,
                  child: ListTile(
                    leading: const Icon(
                      Icons.restaurant_menu,
                      color: Color(0xFFB39DDB),
                    ),
                    title: TeksKantin(
                      menu.nama,
                      ukuran: 16,
                      ketebalan: FontWeight.w600,
                    ),
                    subtitle: TeksKantin(
                      'Rp ${menu.harga}',
                      ukuran: 13,
                      warna: const Color(0xFF777080),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.to(() => DetailMenu(menu: menu));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bukaTambahMenu,
        backgroundColor: const Color(0xFFB39DDB),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
