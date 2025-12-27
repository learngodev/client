import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar({super.key, this.title, this.actions, this.leading});

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 6);

  @override
  Widget build(BuildContext context) {
    final modern = Theme.of(context).extension<ModernUI>()!;
    final gradient = LinearGradient(
      colors: [
        Theme.of(context).colorScheme.primary.withValues(alpha: 0.9),
        Theme.of(context).colorScheme.secondary.withValues(alpha: 0.9),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(modern.sheetRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: modern.shadowColor,
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: leading,
        title: title,
        actions: actions,
      ),
    );
  }
}
