import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/otadex_theme.dart';

class SubscriptionFeatureItem extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool isLast;

  const SubscriptionFeatureItem({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.isLast,
  });

  @override
  State<SubscriptionFeatureItem> createState() =>
      _SubscriptionFeatureItemState();
}

class _SubscriptionFeatureItemState extends State<SubscriptionFeatureItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          14,
          16,
          widget.isLast && !_expanded ? 14 : 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    widget.icon,
                    size: 18,
                    color: widget.color,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: theme.textPrimary,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: theme.textSecondary,
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              child: _expanded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10, left: 48),
                      child: Text(
                        widget.description,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 13,
                          color: theme.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
