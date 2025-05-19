import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kobe/core/assets.dart';
import 'package:kobe/core/colors.dart';
import 'package:kobe/core/strings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KobeColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            const Text(
              KobeStrings.appTitle,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: KobeColors.textDark,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SvgPicture.asset(
                KobeAssets.homeIllustration,
                height: 240.0,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              KobeStrings.chooseFlow,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: KobeColors.textDark,
                  ),
            ),
            const SizedBox(height: 24.0),
            FlowModeButton(
              label: KobeStrings.flowHiit,
              gradient: KobeColors.hiitGradient,
              onTap: () {
                context.push('/hiit-setup');
              },
            ),
            const SizedBox(height: 12.0),
            FlowModeButton(
              label: KobeStrings.flowYoga,
              gradient: KobeColors.yogaGradient,
              onTap: () {},
            ),
            const SizedBox(height: 12.0),
            FlowModeButton(
              label: KobeStrings.flowFocus,
              gradient: KobeColors.focusGradient,
              onTap: () {},
            ),
            const SizedBox(height: 12.0),
            FlowModeButton(
              label: KobeStrings.flowCircuit,
              gradient: KobeColors.circuitGradient,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class FlowModeButton extends StatelessWidget {
  const FlowModeButton({
    required this.label,
    required this.gradient,
    required this.onTap,
    super.key,
  });

  final String label;
  final Gradient gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
