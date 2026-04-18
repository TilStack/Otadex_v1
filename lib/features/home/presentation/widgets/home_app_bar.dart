import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/models/user_rank.dart';
import '../../../../../core/theme/otadex_theme.dart';
import '../../../../../core/widgets/rank_badge.dart';

class HomeAppBar extends StatelessWidget {
  final UserRank rank;

  const HomeAppBar({super.key, required this.rank});

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    return SizedBox(
      height: 64,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Rank aura glow behind logo
          Positioned(
            top: -20,
            left: -20,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    theme.accentColor.withValues(
                      alpha: theme.hasGlowEffect ? 0.12 : 0.05,
                    ),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Logo
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'OTA',
                        style: GoogleFonts.rajdhani(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: theme.textPrimary,
                          letterSpacing: -0.5,
                        ),
                      ),
                      TextSpan(
                        text: 'DEX',
                        style: GoogleFonts.rajdhani(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: theme.accentColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                RankBadge(rank: rank.toOtadexRank),
                const Spacer(),
                // Notification button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.backgroundCard,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.borderSubtle),
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: theme.textSecondary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                // Avatar placeholder
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.accentColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.accentColor.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: theme.accentColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
