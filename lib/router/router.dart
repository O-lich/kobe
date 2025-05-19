import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kobe/core/shell.dart';
import 'package:kobe/features/hiit/views/hiit_setup_view.dart';
import 'package:kobe/features/home/views/home_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter kobeRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        int index = switch (state.uri.toString()) {
          '/home' => 0,
          '/favorites' => 1,
          '/settings' => 2,
          _ => 0,
        };
        return KobeShell(
          currentIndex: index,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: '/favorites',
          name: 'favorites',
          builder: (context, state) => Container(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => Container(),
        ),
      ],
    ),
    GoRoute(
      path: '/hiit-setup',
      name: 'hiit-setup',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const HiitSetupView(),
    ),
  ],
);
