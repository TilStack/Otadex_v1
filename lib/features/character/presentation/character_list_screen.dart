import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/models/character.dart';
import '../../../core/theme/otadex_theme.dart';
import '../../home/presentation/widgets/character_grid_card.dart';

class CharacterListScreen extends StatelessWidget {
  final String title;
  final List<Character> characters;

  const CharacterListScreen({
    super.key,
    required this.title,
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final crossAxisCount = isTablet ? 4 : 3;
    final childAspectRatio = isTablet ? 0.75 : 0.72;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(gradient: theme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.arrow_back_ios_new_rounded,
                          color: theme.textPrimary, size: 20),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.rajdhani(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: theme.textPrimary,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    Text(
                      '${characters.length} personnages',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 13,
                        color: theme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: characters.length,
                  itemBuilder: (context, i) => CharacterGridCard(
                    character: characters[i],
                    onTap: () => context.push(
                      '/character/${characters[i].id}',
                      extra: characters[i],
                    ),
                  )
                      .animate(delay: (40 * i).ms)
                      .fadeIn(duration: 250.ms)
                      .slideY(begin: 0.08, end: 0, duration: 250.ms),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
