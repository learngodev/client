import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar({super.key, this.title, this.actions, this.leading});

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: colorScheme.primary,
      surfaceTintColor: colorScheme.primary,
      elevation: 0,
      foregroundColor: colorScheme.onPrimary,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      actionsIconTheme: IconThemeData(color: colorScheme.onPrimary),
      titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      ),
      leading: leading,
      title: title,
      actions: actions,
    );
  }
}
