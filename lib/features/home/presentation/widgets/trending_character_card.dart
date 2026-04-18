import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/models/character.dart';
import '../../../../../core/theme/otadex_theme.dart';

class TrendingCharacterCard extends StatelessWidget {
  final Character character;
  final int index;

  const TrendingCharacterCard({
    super.key,
    required this.character,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    return Container(
      width: 130,
      margin: EdgeInsets.only(
        left: index == 0 ? 16 : 8,
        right: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: theme.hasGlowEffect
            ? [
                BoxShadow(
                  color: theme.accentGlow,
                  blurRadius: 16,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Card background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    character.cardColor,
                    character.accentColor.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
            // Character icon placeholder
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: character.accentColor.withValues(alpha: 0.2),
                    border: Border.all(
                      color: character.accentColor.withValues(alpha: 0.5),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    color: character.accentColor,
                    size: 32,
                  ),
                ),
              ),
            ),
            // Tier badge
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: character.tierColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: character.tierColor.withValues(alpha: 0.6),
                  ),
                ),
                child: Text(
                  character.tierLabel,
                  style: GoogleFonts.rajdhani(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: character.tierColor,
                  ),
                ),
              ),
            ),
            // Info at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.rajdhani(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      character.animeName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 10,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            color: Color(0xFFFFC107), size: 12),
                        const SizedBox(width: 2),
                        Text(
                          character.rating.toStringAsFixed(1),
                          style: GoogleFonts.nunitoSans(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFC107),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Shimmer overlay (Kage only)
            if (theme.hasShimmerEffect)
              Positioned.fill(
                child: Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: theme.accentShimmer,
                  period: const Duration(milliseconds: 2500),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.transparent,
                          Colors.white.withValues(alpha: 0.04),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
