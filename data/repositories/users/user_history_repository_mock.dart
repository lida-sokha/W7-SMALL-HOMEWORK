import 'user_history_repository.dart';

class UserHistoryRepositoryMock implements UserHistoryRepository {
  @override
  List<String> fetchRecentSongIds() {
    return ['101', '102'];
  }

  @override
  List<String> fetchRecommendSongIds() {
    return ['103', '104', '105'];
  }
}
