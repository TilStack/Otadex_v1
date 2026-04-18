import 'package:flutter/material.dart';

class FeaturedSlide {
  final String id;
  final String title;
  final String subtitle;
  final String tag;
  final Color primaryColor;
  final Color secondaryColor;
  final String category;

  const FeaturedSlide({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.primaryColor,
    required this.secondaryColor,
    required this.category,
  });
}
