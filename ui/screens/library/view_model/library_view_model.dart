import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../../ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final PlayerState _playerState;

  LibraryViewModel({
    required SongRepository songRepository,
    required PlayerState playerState,
  }) : _songRepository = songRepository,
       _playerState = playerState {
    _init();
    _playerState.addListener(notifyListeners);
  }

  void _init() {
    _songs = _songRepository.fetchSongs();
  }

  List<Song> _songs = [];
  List<Song> get songs => _songs;

  bool isSongPlaying(Song song) => _playerState.currentSong == song;
  void play(Song song) {
    _playerState.start(song);
  }

  void stop() => _playerState.stop();

  @override
  void dispose() {
    _playerState.removeListener(notifyListeners);
    super.dispose();
  }
}
