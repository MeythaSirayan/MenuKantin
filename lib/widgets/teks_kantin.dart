import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Poppins dipilih karena memiliki bentuk huruf yang modern dan mudah dibaca.
// Warna dan ketebalan teks dibuat konsisten agar tampilan terlihat rapi.
// Ukuran, warna, dan ketebalan dapat diatur ulang pada setiap pemakaian.
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
