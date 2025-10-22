import 'package:flutter/material.dart';

class AdaptiveDestination {
  const AdaptiveDestination({
    required this.label,
    required this.icon,
    this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
}

class AdaptiveNavigationScaffold extends StatelessWidget {
  const AdaptiveNavigationScaffold({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.child,
    this.appBarTitle,
    this.appBarActions,
    this.fab,
  });

  final List<AdaptiveDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget child;
  final Widget? appBarTitle;
  final List<Widget>? appBarActions;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width >= 1000) {
          return _buildRail(context, extended: true);
        }
        if (width >= 720) {
          return _buildRail(context, extended: false);
        }
        return _buildBottomNav(context);
      },
    );
  }

  Widget _buildRail(BuildContext context, {required bool extended}) {
    final destinationsWidgets = destinations
        .map(
          (destination) => NavigationRailDestination(
            icon: Icon(destination.icon),
            selectedIcon: Icon(destination.selectedIcon ?? destination.icon),
            label: Text(destination.label),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: appBarTitle, actions: appBarActions),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: extended
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.selected,
            extended: extended,
            destinations: destinationsWidgets,
          ),
          const VerticalDivider(width: 1),
          Expanded(child: child),
        ],
      ),
      floatingActionButton: fab,
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final destinationsWidgets = destinations
        .map(
          (destination) => NavigationDestination(
            icon: Icon(destination.icon),
            selectedIcon: Icon(destination.selectedIcon ?? destination.icon),
            label: destination.label,
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: appBarTitle, actions: appBarActions),
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinationsWidgets,
      ),
      floatingActionButton: fab,
    );
  }
}
