import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final _storage = FirebaseStorage.instance;

  Future<List<String>> getCharacterImages({
    required String anime,
    required String character,
  }) async {
    try {
      final cleanAnime = anime.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
      final cleanChar = character.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
      final ref = _storage.ref()
          .child('characters')
          .child(cleanAnime)
          .child(cleanChar);
      final result = await ref.listAll();
      final urls = await Future.wait(
        result.items.map((item) => item.getDownloadURL()),
      );
      return urls;
    } catch (e) {
      return [];
    }
  }

  Future<String?> getCharacterCover({
    required String anime,
    required String character,
  }) async {
    final images = await getCharacterImages(
      anime: anime,
      character: character,
    );
    return images.isNotEmpty ? images.first : null;
  }
}
