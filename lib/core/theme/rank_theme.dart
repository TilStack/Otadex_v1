import 'package:flutter/material.dart';
import '../models/user_rank.dart';

@immutable
class RankTheme extends ThemeExtension<RankTheme> {
  final Color accentColor;
  final Color accentLight;
  final Color accentGlow;
  final Color accentShimmer;

  final Color backgroundPrimary;
  final Color backgroundCard;
  final Color backgroundElevated;
  final Color backgroundInput;

  final Color borderDefault;
  final Color borderActive;
  final Color borderSubtle;

  final Color textPrimary;
  final Color textSecondary;
  final Color textLink;

  final Color rankBadgeColor;
  final Color rankBadgeBg;
  final String rankLabel;

  final bool hasShimmerEffect;
  final bool hasGlowEffect;
  final Gradient backgroundGradient;

  const RankTheme({
    required this.accentColor,
    required this.accentLight,
    required this.accentGlow,
    required this.accentShimmer,
    required this.backgroundPrimary,
    required this.backgroundCard,
    required this.backgroundElevated,
    required this.backgroundInput,
    required this.borderDefault,
    required this.borderActive,
    required this.borderSubtle,
    required this.textPrimary,
    required this.textSecondary,
    required this.textLink,
    required this.rankBadgeColor,
    required this.rankBadgeBg,
    required this.rankLabel,
    required this.hasShimmerEffect,
    required this.hasGlowEffect,
    required this.backgroundGradient,
  });

  // ── GENIN ─────────────────────────────────────────────────────────
  static const RankTheme genin = RankTheme(
    accentColor: Color(0xFFFF6500),
    accentLight: Color(0xFFFF8533),
    accentGlow: Color(0x33FF6500),
    accentShimmer: Color(0x40FF6500),
    backgroundPrimary: Color(0xFF0D0D14),
    backgroundCard: Color(0xFF1A1A2E),
    backgroundElevated: Color(0xFF12172A),
    backgroundInput: Color(0xFF1A1A2E),
    borderDefault: Color(0xFF3D2B8A),
    borderActive: Color(0xFFFF6500),
    borderSubtle: Color(0xFF252540),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFA0A0C0),
    textLink: Color(0xFFFF6500),
    rankBadgeColor: Color(0xFF7EABC9),
    rankBadgeBg: Color(0xFF12202E),
    rankLabel: 'Genin',
    hasShimmerEffect: false,
    hasGlowEffect: false,
    backgroundGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF0D0D14), Color(0xFF111120)],
    ),
  );

  // ── JONIN ─────────────────────────────────────────────────────────
  static const RankTheme jonin = RankTheme(
    accentColor: Color(0xFF9B59B6),
    accentLight: Color(0xFFB07CC6),
    accentGlow: Color(0x339B59B6),
    accentShimmer: Color(0x509B59B6),
    backgroundPrimary: Color(0xFF0A0815),
    backgroundCard: Color(0xFF1E1535),
    backgroundElevated: Color(0xFF160E2A),
    backgroundInput: Color(0xFF1E1535),
    borderDefault: Color(0xFF4A2875),
    borderActive: Color(0xFF9B59B6),
    borderSubtle: Color(0xFF2A1A45),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFB0A0C8),
    textLink: Color(0xFF9B59B6),
    rankBadgeColor: Color(0xFF9B59B6),
    rankBadgeBg: Color(0xFF1E1535),
    rankLabel: 'Jonin',
    hasShimmerEffect: false,
    hasGlowEffect: true,
    backgroundGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF0A0815), Color(0xFF120A25), Color(0xFF0A0815)],
      stops: [0.0, 0.5, 1.0],
    ),
  );

  // ── KAGE ──────────────────────────────────────────────────────────
  static const RankTheme kage = RankTheme(
    accentColor: Color(0xFFFF6500),
    accentLight: Color(0xFFFF8C00),
    accentGlow: Color(0x50FF6500),
    accentShimmer: Color(0x60FF6500),
    backgroundPrimary: Color(0xFF080810),
    backgroundCard: Color(0xFF18140A),
    backgroundElevated: Color(0xFF1A1000),
    backgroundInput: Color(0xFF18140A),
    borderDefault: Color(0xFF3D2500),
    borderActive: Color(0xFFFF6500),
    borderSubtle: Color(0xFF251800),
    textPrimary: Color(0xFFFFF5EB),
    textSecondary: Color(0xFFC0A87A),
    textLink: Color(0xFFFF6500),
    rankBadgeColor: Color(0xFFFF6500),
    rankBadgeBg: Color(0xFF2D1500),
    rankLabel: 'Kage',
    hasShimmerEffect: true,
    hasGlowEffect: true,
    backgroundGradient: RadialGradient(
      center: Alignment(0, -0.6),
      radius: 1.2,
      colors: [Color(0xFF1A0E00), Color(0xFF080810)],
      stops: [0.0, 1.0],
    ),
  );

  static RankTheme forRank(UserRank rank) => switch (rank) {
        UserRank.genin => RankTheme.genin,
        UserRank.jonin => RankTheme.jonin,
        UserRank.kage => RankTheme.kage,
      };

  @override
  RankTheme copyWith({
    Color? accentColor,
    Color? accentLight,
    Color? accentGlow,
    Color? accentShimmer,
    Color? backgroundPrimary,
    Color? backgroundCard,
    Color? backgroundElevated,
    Color? backgroundInput,
    Color? borderDefault,
    Color? borderActive,
    Color? borderSubtle,
    Color? textPrimary,
    Color? textSecondary,
    Color? textLink,
    Color? rankBadgeColor,
    Color? rankBadgeBg,
    String? rankLabel,
    bool? hasShimmerEffect,
    bool? hasGlowEffect,
    Gradient? backgroundGradient,
  }) {
    return RankTheme(
      accentColor: accentColor ?? this.accentColor,
      accentLight: accentLight ?? this.accentLight,
      accentGlow: accentGlow ?? this.accentGlow,
      accentShimmer: accentShimmer ?? this.accentShimmer,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundCard: backgroundCard ?? this.backgroundCard,
      backgroundElevated: backgroundElevated ?? this.backgroundElevated,
      backgroundInput: backgroundInput ?? this.backgroundInput,
      borderDefault: borderDefault ?? this.borderDefault,
      borderActive: borderActive ?? this.borderActive,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textLink: textLink ?? this.textLink,
      rankBadgeColor: rankBadgeColor ?? this.rankBadgeColor,
      rankBadgeBg: rankBadgeBg ?? this.rankBadgeBg,
      rankLabel: rankLabel ?? this.rankLabel,
      hasShimmerEffect: hasShimmerEffect ?? this.hasShimmerEffect,
      hasGlowEffect: hasGlowEffect ?? this.hasGlowEffect,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  RankTheme lerp(RankTheme? other, double t) {
    if (other == null) return this;
    return RankTheme(
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      accentLight: Color.lerp(accentLight, other.accentLight, t)!,
      accentGlow: Color.lerp(accentGlow, other.accentGlow, t)!,
      accentShimmer: Color.lerp(accentShimmer, other.accentShimmer, t)!,
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t)!,
      backgroundCard: Color.lerp(backgroundCard, other.backgroundCard, t)!,
      backgroundElevated:
          Color.lerp(backgroundElevated, other.backgroundElevated, t)!,
      backgroundInput: Color.lerp(backgroundInput, other.backgroundInput, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderActive: Color.lerp(borderActive, other.borderActive, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textLink: Color.lerp(textLink, other.textLink, t)!,
      rankBadgeColor: Color.lerp(rankBadgeColor, other.rankBadgeColor, t)!,
      rankBadgeBg: Color.lerp(rankBadgeBg, other.rankBadgeBg, t)!,
      rankLabel: t < 0.5 ? rankLabel : other.rankLabel,
      hasShimmerEffect: t < 0.5 ? hasShimmerEffect : other.hasShimmerEffect,
      hasGlowEffect: t < 0.5 ? hasGlowEffect : other.hasGlowEffect,
      backgroundGradient:
          t < 0.5 ? backgroundGradient : other.backgroundGradient,
    );
  }
}
