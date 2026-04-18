import '../widgets/rank_badge.dart';

enum UserRank { genin, jonin, kage }

extension UserRankX on UserRank {
  OtadexRank get toOtadexRank {
    switch (this) {
      case UserRank.genin:
        return OtadexRank.genin;
      case UserRank.jonin:
        return OtadexRank.jonin;
      case UserRank.kage:
        return OtadexRank.kage;
    }
  }

  String get label {
    switch (this) {
      case UserRank.genin:
        return 'Genin';
      case UserRank.jonin:
        return 'Jonin';
      case UserRank.kage:
        return 'Kage';
    }
  }

  static UserRank fromString(String value) {
    switch (value) {
      case 'jonin':
        return UserRank.jonin;
      case 'kage':
        return UserRank.kage;
      default:
        return UserRank.genin;
    }
  }
}
