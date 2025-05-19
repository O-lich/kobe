import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kobe/core/colors.dart';

class KobeShell extends StatelessWidget {
  const KobeShell({
    required this.child,
    required this.currentIndex,
    super.key,
  });

  final Widget child;
  final int currentIndex;

  static const List<String> _routes = ['/home', '/favorites', '/settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KobeColors.background,
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: KobeColors.accent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          context.go(_routes[index]);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
