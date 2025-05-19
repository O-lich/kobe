// app.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kobe/core/colors.dart';
import 'package:kobe/router/router.dart';

class KobeTimerApp extends StatelessWidget {
  const KobeTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KOBE Timer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: KobeColors.primary),
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: KobeColors.background,
      ),
      routerConfig: kobeRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
