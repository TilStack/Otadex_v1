import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../models/character.dart';
import '../models/anime_entry.dart';
import '../models/creator_entry.dart';
import '../services/firestore_character_service.dart';
import '../services/otadex_data_service.dart';

// ── Root data service ───────────────────────────────────────────────────────
final otadexServiceProvider = FutureProvider<OtadexDataService>((ref) {
  return OtadexDataService.load();
});

// ── Firestore service ───────────────────────────────────────────────────────
final _firestoreServiceProvider = Provider<FirestoreCharacterService>(
  (_) => FirestoreCharacterService(),
);

// ── Characters fusionnés : tous animés Firestore + mock data non importés ────
// Firestore est la source principale (tous animés confondus).
// Le mock complète uniquement les animés pas encore importés.
final allCharactersProvider = FutureProvider<List<Character>>((ref) async {
  final firestoreChars = await ref
      .watch(_firestoreServiceProvider)
      .getAllCharacters(limit: 100);

  final mockAsync = ref.watch(otadexServiceProvider);
  final mockChars = mockAsync.valueOrNull?.characters ?? [];

  if (firestoreChars.isNotEmpty) {
    final firestoreIds = firestoreChars.map((c) => c.id).toSet();
    final mockOnly =
        mockChars.where((c) => !firestoreIds.contains(c.id)).toList();
    return [...firestoreChars, ...mockOnly];
  }

  return mockChars;
});

final newCharactersProvider =
    FutureProvider.family<List<Character>, String?>((ref, category) async {
  final all = await ref.watch(allCharactersProvider.future);
  final newChars = all.where((c) => c.isNew || c.isTrending).toList();
  if (category == null || category == 'Tous') return newChars;
  return newChars.where((c) => c.category == category).toList();
});

final recommendedCharactersProvider =
    FutureProvider<List<Character>>((ref) async {
  final all = await ref.watch(allCharactersProvider.future);
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(AppConstants.keyUserInterests);
  final recommended = all.where((c) => c.isRecommended).toList();
  if (raw == null || raw.isEmpty) return recommended;
  final interests = List<String>.from(jsonDecode(raw) as List);
  if (interests.isEmpty) return recommended;
  final filtered = recommended.where((c) => interests.contains(c.category)).toList();
  return filtered.isEmpty ? recommended : filtered;
});

// ── Animes ──────────────────────────────────────────────────────────────────
final allAnimesProvider = FutureProvider<List<AnimeEntry>>((ref) async {
  final firestoreAnimes = await ref
      .watch(_firestoreServiceProvider)
      .getAllAnimes();
  if (firestoreAnimes.isNotEmpty) return firestoreAnimes;
  final mockAsync = ref.watch(otadexServiceProvider);
  return mockAsync.valueOrNull?.animes ?? [];
});

// ── Creators ────────────────────────────────────────────────────────────────
final allCreatorsProvider = FutureProvider<List<CreatorEntry>>((ref) async {
  final firestoreCreators = await ref
      .watch(_firestoreServiceProvider)
      .getAllCreators();
  if (firestoreCreators.isNotEmpty) return firestoreCreators;
  final mockAsync = ref.watch(otadexServiceProvider);
  return mockAsync.valueOrNull?.creators ?? [];
});

