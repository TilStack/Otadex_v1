import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/models/character.dart';
import '../../../../../core/theme/otadex_theme.dart';

class CharacterGridCard extends StatelessWidget {
  final Character character;

  const CharacterGridCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: theme.hasGlowEffect
            ? [
                BoxShadow(
                  color: theme.accentGlow,
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    character.cardColor,
                    character.accentColor.withValues(alpha: 0.25),
                  ],
                ),
              ),
            ),
            // Character icon
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: character.accentColor.withValues(alpha: 0.2),
                    border: Border.all(
                      color: character.accentColor.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Icon(Icons.person, color: character.accentColor, size: 26),
                ),
              ),
            ),
            // Tier badge top-right
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: character.tierColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: character.tierColor.withValues(alpha: 0.5),
                  ),
                ),
                child: Text(
                  character.tierLabel,
                  style: GoogleFonts.rajdhani(
                    fontSize: 10,
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
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.75),
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
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      character.animeName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 9,
                        color: Colors.white.withValues(alpha: 0.55),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            color: Color(0xFFFFC107), size: 10),
                        const SizedBox(width: 2),
                        Text(
                          character.rating.toStringAsFixed(1),
                          style: GoogleFonts.nunitoSans(
                            fontSize: 10,
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
            // Shimmer (Kage only)
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
