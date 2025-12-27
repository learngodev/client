import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum PillButtonVariant { primary, outline, ghost }

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = PillButtonVariant.primary,
    this.compact = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final PillButtonVariant variant;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final modern = theme.extension<ModernUI>()!;
    final primary = theme.colorScheme.primary;
    final text = variant == PillButtonVariant.primary
        ? Colors.white
        : modern.textPrimary;

    Color background;
    Color borderColor;
    switch (variant) {
      case PillButtonVariant.primary:
        background = primary;
        borderColor = Colors.transparent;
      case PillButtonVariant.outline:
        background = Colors.transparent;
        borderColor = modern.borderSubtle;
      case PillButtonVariant.ghost:
        background = modern.glassSurface;
        borderColor = Colors.transparent;
    }

    final padding = compact
        ? const EdgeInsets.symmetric(horizontal: 14, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 18, vertical: 12);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 150),
      opacity: onPressed == null ? 0.6 : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: borderColor),
          boxShadow: variant == PillButtonVariant.primary
              ? [
                  BoxShadow(
                    color: primary.withValues(alpha: 0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: onPressed,
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18, color: text),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: text,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
