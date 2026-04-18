import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/otadex_theme.dart';

class OtadexBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const OtadexBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    (icon: Icons.home_rounded, label: 'Accueil'),
    (icon: Icons.search_rounded, label: 'Recherche'),
    (icon: Icons.collections_bookmark_rounded, label: 'Collection'),
    (icon: Icons.person_rounded, label: 'Profil'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundCard,
        border: Border(
          top: BorderSide(color: theme.borderSubtle, width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (i) {
              final isActive = i == currentIndex;
              return GestureDetector(
                onTap: () => onTap(i),
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          _items[i].icon,
                          color: isActive
                              ? theme.accentColor
                              : theme.textSecondary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 3),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: GoogleFonts.nunitoSans(
                          fontSize: 10,
                          fontWeight: isActive
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isActive
                              ? theme.accentColor
                              : theme.textSecondary,
                        ),
                        child: Text(_items[i].label),
                      ),
                      const SizedBox(height: 2),
                      // Active dot indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: isActive ? 16 : 0,
                        height: 3,
                        decoration: BoxDecoration(
                          color: theme.accentColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
