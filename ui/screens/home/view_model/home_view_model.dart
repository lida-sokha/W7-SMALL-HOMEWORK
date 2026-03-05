import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../../ui/states/player_state.dart';
import '../../../../data/repositories/users/user_history_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final PlayerState _playerState;
  final UserHistoryRepository _historyRepository;

  List<Song> _recentSongs = [];
  List<Song> _recommendedSongs = [];

  HomeViewModel({
    required SongRepository songRepository,
    required PlayerState playerState,
    required UserHistoryRepository historyRepository,
  }) : _songRepository = songRepository,
       _playerState = playerState,
       _historyRepository = historyRepository {
    _init();
    _playerState.addListener(notifyListeners);
  }

  void _init() {
    final recentId = _historyRepository.fetchRecentSongIds();
    _recentSongs = recentId
        .map((id) => _songRepository.fetchSongById(id))
        .whereType<Song>()
        .toList();

    final allsong = _songRepository.fetchSongs();
    _recommendedSongs = List.from(allsong)..shuffle();
  }

  List<Song> get recentSongs => _recentSongs;
  List<Song> get recommendedSongs => _recommendedSongs;

  bool isSongPlaying(Song song) => _playerState.currentSong == song;

  void play(Song song) => _playerState.start(song);
  void stop() => _playerState.stop();

  @override
  void dispose() {
    _playerState.removeListener(notifyListeners);
    super.dispose();
  }
}
