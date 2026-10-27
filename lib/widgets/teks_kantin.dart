import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget  menggunakan font Poppins karena teks terlihat modern.
// Warna, ukuran, dan ketebalan teks bisa diatur sesuai kebutuhan tampilan.
// Gaya sederhana dipilih agar tampilan aplikasi kantin tetap rapi dan konsisten.

class TeksKantin extends StatelessWidget {
  final String teks;
  final double ukuran;
  final Color warna;
  final FontWeight ketebalan;

  const TeksKantin(
    this.teks, {
    super.key,
    this.ukuran = 16,
    this.warna = const Color(0xFF263238),
    this.ketebalan = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      teks,
      style: GoogleFonts.poppins(
        fontSize: ukuran,
        color: warna,
        fontWeight: ketebalan,
      ),
    );
  }
}
