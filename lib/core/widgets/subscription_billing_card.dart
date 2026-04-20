import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/otadex_theme.dart';

class SubscriptionBillingCard extends StatelessWidget {
  final String label;
  final String price;
  final String period;
  final String? badge;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const SubscriptionBillingCard({
    super.key,
    required this.label,
    required this.price,
    required this.period,
    required this.badge,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.07) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color : theme.borderDefault,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (badge != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badge!,
                  style: GoogleFonts.rajdhani(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.success,
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
            Text(
              label,
              style: GoogleFonts.rajdhani(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isSelected ? color : theme.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: GoogleFonts.rajdhani(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: isSelected ? color : theme.textPrimary,
              ),
            ),
            Text(
              period,
              style: GoogleFonts.nunitoSans(
                fontSize: 11,
                color: theme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
