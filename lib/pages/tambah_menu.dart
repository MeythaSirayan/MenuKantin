import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu_kantin.dart';
import '../widgets/teks_kantin.dart';

class TambahMenu extends StatefulWidget {
  const TambahMenu({super.key});

  @override
  State<TambahMenu> createState() => _TambahMenuState();
}

class _TambahMenuState extends State<TambahMenu> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();

  final TextEditingController _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  void simpanMenu() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String nama = _namaController.text.trim();
    final String teksHarga = _hargaController.text.trim();
    final int? harga = int.tryParse(teksHarga);

    if (harga == null || harga <= 0) {
      return;
    }

    final MenuKantin menuBaru = MenuKantin(nama: nama, harga: harga);

    Get.back<MenuKantin>(result: menuBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB39DDB),
        foregroundColor: const Color(0xFF6A4C93),
        title: const TeksKantin(
          'Tambah Menu',
          ukuran: 20,
          warna: Colors.white,
          ketebalan: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Menu',
                  hintText: 'Contoh: Bakso',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.restaurant),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama menu wajib diisi';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Harga Menu',
                  hintText: 'Contoh: 10000',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.payments),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harga menu wajib diisi';
                  }

                  final String harga = value.trim();

                  if (!RegExp(r'^[0-9]+$').hasMatch(harga)) {
                    return 'Harga hanya boleh berupa angka';
                  }

                  final int? angka = int.tryParse(harga);

                  if (angka == null) {
                    return 'Harga tidak valid';
                  }

                  if (angka <= 0) {
                    return 'Harga harus lebih dari nol';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: simpanMenu,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB39DDB),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const TeksKantin(
                    'Simpan Menu',
                    ukuran: 16,
                    warna: Colors.white,
                    ketebalan: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
