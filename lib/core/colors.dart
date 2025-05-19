import 'package:flutter/material.dart';

class KobeColors {
  static const Color primary = Color(0xFF00B1C6);
  static const Color accent = Color(0xFF00728C);
  static const Color background = Color(0xFFF8FBFC);
  static const Color textDark = Color(0xFF0A2A2F);

  static const Gradient hiitGradient = LinearGradient(
    colors: [Color(0xFF00B1C6), Color(0xFF00728C)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Gradient yogaGradient = LinearGradient(
    colors: [Color(0xFF45C4B0), Color(0xFF007B6F)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Gradient focusGradient = LinearGradient(
    colors: [Color(0xFF429FE7), Color(0xFF285C92)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Gradient circuitGradient = LinearGradient(
    colors: [Color(0xFF5B2C6F), Color(0xFFBB8FCE)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
