import 'package:flutter/material.dart';
import '../models/user_rank.dart';
import 'rank_theme.dart';

class OtadexTheme extends InheritedWidget {
  final RankTheme rankTheme;
  final UserRank currentRank;

  const OtadexTheme({
    super.key,
    required this.rankTheme,
    required this.currentRank,
    required super.child,
  });

  static RankTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<OtadexTheme>();
    assert(
      result != null,
      'OtadexTheme introuvable dans l\'arbre de widgets. '
      'Vérifier que OtadexThemeWrapper enveloppe bien MaterialApp.',
    );
    return result!.rankTheme;
  }

  static UserRank rankOf(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<OtadexTheme>();
    return result?.currentRank ?? UserRank.genin;
  }

  @override
  bool updateShouldNotify(OtadexTheme oldWidget) =>
      oldWidget.currentRank != currentRank ||
      oldWidget.rankTheme != rankTheme;
}
