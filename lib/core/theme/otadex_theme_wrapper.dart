import 'package:flutter/material.dart';
import '../models/user_rank.dart';
import 'otadex_theme.dart';
import 'rank_theme.dart';

class OtadexThemeWrapper extends StatefulWidget {
  final UserRank initialRank;
  final Widget child;

  const OtadexThemeWrapper({
    super.key,
    required this.initialRank,
    required this.child,
  });

  static OtadexThemeWrapperState? of(BuildContext context) =>
      context.findAncestorStateOfType<OtadexThemeWrapperState>();

  @override
  State<OtadexThemeWrapper> createState() => OtadexThemeWrapperState();
}

class OtadexThemeWrapperState extends State<OtadexThemeWrapper>
    with TickerProviderStateMixin {
  late UserRank _currentRank;
  late RankTheme _currentRankTheme;
  late AnimationController _transitionController;

  @override
  void initState() {
    super.initState();
    _currentRank = widget.initialRank;
    _currentRankTheme = RankTheme.forRank(_currentRank);
    _transitionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  void updateRank(UserRank newRank) {
    if (newRank == _currentRank) return;
    setState(() {
      _currentRank = newRank;
      _currentRankTheme = RankTheme.forRank(newRank);
    });
    _transitionController.forward(from: 0);
  }

  UserRank get currentRank => _currentRank;

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OtadexTheme(
      rankTheme: _currentRankTheme,
      currentRank: _currentRank,
      child: widget.child,
    );
  }
}
