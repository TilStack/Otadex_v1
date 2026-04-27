import 'package:flutter/material.dart';
import '../models/user_rank.dart';
import 'otadex_theme.dart';
import 'rank_theme.dart';

class OtadexThemeWrapper extends StatefulWidget {
  final UserRank initialRank;
  final bool isDark;
  final Widget child;

  const OtadexThemeWrapper({
    super.key,
    required this.initialRank,
    this.isDark = true,
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
    _currentRankTheme = RankTheme.forRank(_currentRank, isDark: widget.isDark);
    _transitionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void didUpdateWidget(OtadexThemeWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isDark != widget.isDark) {
      setState(() {
        _currentRankTheme = RankTheme.forRank(_currentRank, isDark: widget.isDark);
      });
    }
  }

  void updateRank(UserRank newRank) {
    if (newRank == _currentRank) return;
    setState(() {
      _currentRank = newRank;
      _currentRankTheme = RankTheme.forRank(newRank, isDark: widget.isDark);
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
