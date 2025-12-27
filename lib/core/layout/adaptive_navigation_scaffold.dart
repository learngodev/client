import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/gradient_app_bar.dart';

class AdaptiveDestination {
  const AdaptiveDestination({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.badgeCount,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final int? badgeCount;
}

class AdaptiveNavigationScaffold extends StatelessWidget {
  const AdaptiveNavigationScaffold({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.child,
    this.compactDestinations,
    this.compactSelectedIndex,
    this.onCompactDestinationSelected,
    this.appBarTitle,
    this.appBarActions,
    this.appBarLeading,
    this.fab,
    this.compactBreakpoint = 720,
    this.extendedRailBreakpoint = 1080,
    this.navigationBarLabelBehavior =
        NavigationDestinationLabelBehavior.alwaysShow,
    this.useSafeArea = true,
    this.userInfo,
    this.hideAppBar = false,
  });

  final List<AdaptiveDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget child;
  final List<AdaptiveDestination>? compactDestinations;
  final int? compactSelectedIndex;
  final ValueChanged<int>? onCompactDestinationSelected;
  final Widget? appBarTitle;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;
  final Widget? fab;
  final double compactBreakpoint;
  final double extendedRailBreakpoint;
  final NavigationDestinationLabelBehavior navigationBarLabelBehavior;
  final bool useSafeArea;
  final NavUserInfo? userInfo;
  final bool hideAppBar;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final useCompact = width < compactBreakpoint;

        final effectiveDestinations = useCompact && compactDestinations != null
            ? compactDestinations!
            : destinations;

        final effectiveSelectedIndex =
            useCompact && compactSelectedIndex != null
            ? compactSelectedIndex!
            : selectedIndex;

        final effectiveOnSelected =
            useCompact && onCompactDestinationSelected != null
            ? onCompactDestinationSelected!
            : onDestinationSelected;

        if (width >= extendedRailBreakpoint) {
          return _buildRail(
            context,
            extended: true,
            navDestinations: destinations,
            navSelectedIndex: selectedIndex,
            onSelected: onDestinationSelected,
          );
        }
        if (width >= compactBreakpoint) {
          return _buildRail(
            context,
            extended: false,
            navDestinations: destinations,
            navSelectedIndex: selectedIndex,
            onSelected: onDestinationSelected,
          );
        }
        return _buildBottomNav(
          context,
          navDestinations: effectiveDestinations,
          navSelectedIndex: effectiveSelectedIndex,
          onSelected: effectiveOnSelected,
          isCompact: useCompact,
        );
      },
    );
  }

  Widget _buildRail(
    BuildContext context, {
    required bool extended,
    required List<AdaptiveDestination> navDestinations,
    required int navSelectedIndex,
    required ValueChanged<int> onSelected,
  }) {
    final modern = Theme.of(context).extension<ModernUI>()!;
    final showLabels = extended;

    return Scaffold(
      appBar: hideAppBar
          ? null
          : GradientAppBar(
              title: appBarTitle,
              actions: appBarActions,
              leading: appBarLeading,
            ),
      body: SafeArea(
        top: useSafeArea,
        bottom: useSafeArea,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(modern.sheetRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: Container(
                    width: extended ? 260 : 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          modern.elevatedSurface.withValues(alpha: 0.96),
                          modern.elevatedSurface.withValues(alpha: 0.86),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(modern.sheetRadius),
                      border: Border.all(color: modern.borderSubtle),
                      boxShadow: [
                        BoxShadow(
                          color: modern.shadowColor,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            itemBuilder: (context, index) {
                              final destination = navDestinations[index];
                              return _RailNavItem(
                                label: destination.label,
                                icon: destination.icon,
                                selectedIcon: destination.selectedIcon,
                                badgeCount: destination.badgeCount ?? 0,
                                selected: index == navSelectedIndex,
                                showLabel: showLabels,
                                modern: modern,
                                onTap: () => onSelected(index),
                              );
                            },
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 8),
                            itemCount: navDestinations.length,
                          ),
                        ),
                        if (userInfo != null)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                            child: _UserCard(
                              info: userInfo!,
                              modern: modern,
                              compact: !extended,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
      floatingActionButton: fab,
    );
  }

  Widget _buildBottomNav(
    BuildContext context, {
    required List<AdaptiveDestination> navDestinations,
    required int navSelectedIndex,
    required ValueChanged<int> onSelected,
    required bool isCompact,
  }) {
    final modern = Theme.of(context).extension<ModernUI>()!;
    final isCrowded = navDestinations.length > 4;
    final showUserInAppBar = userInfo != null && !hideAppBar;

    final effectiveActions = [
      ...?appBarActions,
      if (showUserInAppBar) _UserAvatarButton(info: userInfo!),
    ];

    return Scaffold(
      appBar: hideAppBar
          ? null
          : GradientAppBar(
              title: appBarTitle,
              actions: effectiveActions,
              leading: appBarLeading,
            ),
      body: SafeArea(top: useSafeArea, bottom: false, child: child),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(color: modern.borderSubtle.withValues(alpha: 0.4)),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                child: Row(
                  children: [
                    for (var i = 0; i < navDestinations.length; i++)
                      Expanded(
                        child: _BottomNavItem(
                          label: navDestinations[i].label,
                          icon: navDestinations[i].icon,
                          selectedIcon: navDestinations[i].selectedIcon,
                          badgeCount: navDestinations[i].badgeCount ?? 0,
                          selected: i == navSelectedIndex,
                          modern: modern,
                          onTap: () => onSelected(i),
                          showLabel:
                              !isCrowded &&
                              navigationBarLabelBehavior !=
                                  NavigationDestinationLabelBehavior.alwaysHide,
                          compact: isCrowded,
                        ),
                      ),
                  ],
                ),
              ),
              if (userInfo != null && !showUserInAppBar && !isCompact)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: _UserCard(
                    info: userInfo!,
                    modern: modern,
                    compact: false,
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: fab,
    );
  }
}

class NavUserInfo {
  const NavUserInfo({
    required this.title,
    this.subtitle,
    this.avatar,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Widget? avatar;
  final VoidCallback? onTap;
}

class _RailNavItem extends StatelessWidget {
  const _RailNavItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.showLabel,
    required this.modern,
    required this.onTap,
    this.selectedIcon,
    this.badgeCount = 0,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final bool selected;
  final bool showLabel;
  final int badgeCount;
  final ModernUI modern;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (showLabel) {
      // Extended (Drawer) Item
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: selected
                  ? colorScheme.primaryContainer
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                _NavIcon(
                  icon: icon,
                  selectedIcon: selectedIcon,
                  selected: selected,
                  badgeCount: badgeCount,
                  modern: modern,
                  colorOverride: selected
                      ? colorScheme.onPrimaryContainer
                      : modern.textSecondary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: selected
                          ? colorScheme.onPrimaryContainer
                          : modern.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Compact (Rail) Item
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 56,
            height: 32,
            decoration: BoxDecoration(
              color: selected
                  ? colorScheme.primaryContainer
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: _NavIcon(
                icon: icon,
                selectedIcon: selectedIcon,
                selected: selected,
                badgeCount: badgeCount,
                modern: modern,
                colorOverride: selected
                    ? colorScheme.onPrimaryContainer
                    : modern.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.modern,
    required this.onTap,
    required this.showLabel,
    this.selectedIcon,
    this.badgeCount = 0,
    this.compact = false,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final bool selected;
  final bool showLabel;
  final int badgeCount;
  final ModernUI modern;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final selectedColor = colorScheme.primary;
    final unselectedColor = modern.textSecondary;

    final labelStyle = theme.textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(modern.cardRadius),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              width: selected ? 64 : 32,
              height: 32,
              decoration: BoxDecoration(
                color: selected
                    ? colorScheme.primaryContainer
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: _NavIcon(
                  icon: icon,
                  selectedIcon: selectedIcon,
                  selected: selected,
                  badgeCount: badgeCount,
                  modern: modern,
                  colorOverride: selected
                      ? colorScheme.onPrimaryContainer
                      : unselectedColor,
                ),
              ),
            ),
            if (showLabel) ...[
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: labelStyle?.copyWith(
                  color: selected ? selectedColor : unselectedColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    required this.selected,
    required this.modern,
    this.selectedIcon,
    this.badgeCount = 0,
    this.colorOverride,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final bool selected;
  final int badgeCount;
  final ModernUI modern;
  final Color? colorOverride;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      selected ? (selectedIcon ?? icon) : icon,
      color:
          colorOverride ??
          (selected ? modern.textPrimary : modern.textSecondary),
      size: 22,
    );

    if (badgeCount <= 0) return iconWidget;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        iconWidget,
        Positioned(
          right: -5,
          top: -5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.surface,
                width: 1.5,
              ),
            ),
            constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
            alignment: Alignment.center,
            child: Text(
              badgeCount > 99 ? '99+' : badgeCount.toString(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onError,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    required this.info,
    required this.modern,
    this.compact = false,
  });

  final NavUserInfo info;
  final ModernUI modern;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar =
        info.avatar ??
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            info.title.isNotEmpty ? info.title[0] : '?',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        );

    if (compact) {
      return Center(
        child: InkWell(
          onTap: info.onTap,
          borderRadius: BorderRadius.circular(20),
          child: avatar,
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: info.onTap,
        borderRadius: BorderRadius.circular(modern.cardRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              avatar,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: modern.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (info.subtitle != null)
                      Text(
                        info.subtitle!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: modern.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: modern.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserAvatarButton extends StatelessWidget {
  const _UserAvatarButton({required this.info});

  final NavUserInfo info;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatar =
        info.avatar ??
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            info.title.isNotEmpty ? info.title[0] : '?',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        );

    return InkWell(
      onTap: info.onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(padding: const EdgeInsets.all(8.0), child: avatar),
    );
  }
}
