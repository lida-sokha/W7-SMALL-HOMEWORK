import '../../../model/songs/song.dart';

abstract class UserHistoryRepository {
  List<String> fetchRecentSongIds();
}
