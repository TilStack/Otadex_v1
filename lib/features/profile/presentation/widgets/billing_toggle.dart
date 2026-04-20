import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/otadex_theme.dart';

class BillingToggle extends StatelessWidget {
  final String cycle;
  final ValueChanged<String> onChanged;

  const BillingToggle({
    super.key,
    required this.cycle,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    final s = AppStrings.of(context);
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.backgroundCard,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _BillingToggleOption(
            label: s.monthly,
            value: 'mensuel',
            current: cycle,
            badge: null,
            onTap: onChanged,
          ),
          _BillingToggleOption(
            label: s.annual,
            value: 'annuel',
            current: cycle,
            badge: '-10%',
            onTap: onChanged,
          ),
        ],
      ),
    );
  }
}

class _BillingToggleOption extends StatelessWidget {
  final String label;
  final String value;
  final String current;
  final String? badge;
  final ValueChanged<String> onTap;

  const _BillingToggleOption({
    required this.label,
    required this.value,
    required this.current,
    required this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    final active = current == value;
    return GestureDetector(
      onTap: () => onTap(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: GoogleFonts.nunitoSans(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: active ? AppColors.backgroundDeep : theme.textSecondary,
              ),
            ),
            if (badge != null) ...[
              const SizedBox(width: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge!,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
