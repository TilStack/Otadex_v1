import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../core/data/mock_data.dart';
import '../../../../../core/models/character.dart';
import 'character_grid_card.dart';
import 'section_header.dart';

class CharacterGridSection extends StatelessWidget {
  final int selectedCategoryIndex;

  const CharacterGridSection({super.key, required this.selectedCategoryIndex});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = selectedCategoryIndex == 0
        ? null
        : MockData.categories[selectedCategoryIndex];

    final newChars = MockData.newCharacters(category: selectedCategory);
    final recommended = MockData.recommended();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: '✨ Nouveautés', actionLabel: 'Voir tout'),
        _buildGrid(newChars, startOffset: 0),
        const SectionHeader(title: '⭐ Recommandés', actionLabel: 'Voir tout'),
        _buildGrid(recommended, startOffset: newChars.length),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildGrid(List<Character> chars, {required int startOffset}) {
    if (chars.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Center(
          child: Text(
            'Aucun personnage dans cette catégorie',
            style: TextStyle(color: Color(0xFFA0A0C0), fontSize: 14),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.72,
      ),
      itemCount: chars.length,
      itemBuilder: (_, i) => CharacterGridCard(character: chars[i])
          .animate(delay: (60 * i).ms)
          .fadeIn(duration: 300.ms)
          .slideY(begin: 0.1, end: 0, duration: 300.ms, curve: Curves.easeOut),
    );
  }
}
