import 'package:flutter/material.dart';

enum CharacterTier { ss, s, a, b }

class Character {
  final String id;
  final String name;
  final String animeName;
  final Color cardColor;
  final Color accentColor;
  final CharacterTier tier;
  final double rating;
  final String category;
  final bool isTrending;
  final bool isNew;
  final bool isRecommended;

  const Character({
    required this.id,
    required this.name,
    required this.animeName,
    required this.cardColor,
    required this.accentColor,
    required this.tier,
    required this.rating,
    required this.category,
    this.isTrending = false,
    this.isNew = false,
    this.isRecommended = false,
  });

  String get tierLabel {
    switch (tier) {
      case CharacterTier.ss:
        return 'SS';
      case CharacterTier.s:
        return 'S';
      case CharacterTier.a:
        return 'A';
      case CharacterTier.b:
        return 'B';
    }
  }

  Color get tierColor {
    switch (tier) {
      case CharacterTier.ss:
        return const Color(0xFFFF6500);
      case CharacterTier.s:
        return const Color(0xFF9B59B6);
      case CharacterTier.a:
        return const Color(0xFF7EABC9);
      case CharacterTier.b:
        return const Color(0xFF22C55E);
    }
  }
}
