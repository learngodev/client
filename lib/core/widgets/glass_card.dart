import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.onTap,
    this.gradient,
  });

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final modern = Theme.of(context).extension<ModernUI>()!;
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient:
            gradient ??
            LinearGradient(
              colors: [
                modern.glassSurface,
                modern.glassSurface.withValues(alpha: 0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
        borderRadius: BorderRadius.circular(modern.cardRadius),
        border: Border.all(color: modern.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: modern.shadowColor,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );

    final clipped = ClipRRect(
      borderRadius: BorderRadius.circular(modern.cardRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: card,
      ),
    );

    final wrapped = margin == null
        ? clipped
        : Padding(padding: margin!, child: clipped);

    if (onTap == null) {
      return wrapped;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(modern.cardRadius),
        child: wrapped,
      ),
    );
  }
}
