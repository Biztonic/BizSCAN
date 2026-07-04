import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/context_extensions.dart';

class DashboardShell extends StatelessWidget {
  final Widget child;

  const DashboardShell({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/vehicle')) return 1;
    if (location.startsWith('/reports')) return 2;
    if (location.startsWith('/history')) return 3;
    if (location.startsWith('/settings')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/vehicle');
        break;
      case 2:
        context.go('/reports');
        break;
      case 3:
        context.go('/history');
        break;
      case 4:
        context.go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) => _onItemTapped(index, context),
          elevation: 0,
          backgroundColor: context.colors.surface,
          indicatorColor: context.colors.primary.withOpacity(0.12),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined, color: context.colors.onSurface.withOpacity(0.7)),
              selectedIcon: Icon(Icons.dashboard_rounded, color: context.colors.primary),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.directions_car_outlined, color: context.colors.onSurface.withOpacity(0.7)),
              selectedIcon: Icon(Icons.directions_car_filled_rounded, color: context.colors.primary),
              label: 'Vehicle',
            ),
            NavigationDestination(
              icon: Icon(Icons.assessment_outlined, color: context.colors.onSurface.withOpacity(0.7)),
              selectedIcon: Icon(Icons.assessment_rounded, color: context.colors.primary),
              label: 'Reports',
            ),
            NavigationDestination(
              icon: Icon(Icons.history_outlined, color: context.colors.onSurface.withOpacity(0.7)),
              selectedIcon: Icon(Icons.history_rounded, color: context.colors.primary),
              label: 'History',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined, color: context.colors.onSurface.withOpacity(0.7)),
              selectedIcon: Icon(Icons.settings_rounded, color: context.colors.primary),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
