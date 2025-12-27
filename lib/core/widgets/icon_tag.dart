import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class IconTag extends StatelessWidget {
  const IconTag({
    super.key,
    required this.label,
    required this.icon,
    this.color,
  });

  final String label;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final modern = Theme.of(context).extension<ModernUI>()!;
    final resolved = color ?? modern.textSecondary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: resolved.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: resolved.withValues(alpha: 0.16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: resolved),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: resolved,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
