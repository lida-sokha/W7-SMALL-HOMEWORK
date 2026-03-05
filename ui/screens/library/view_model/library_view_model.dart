import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../../ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  List<Song> _songs = [];
  List<Song> get songs => _songs;

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  LibraryViewModel({required this.songRepository, required this.playerState}) {
    _init();
    playerState.addListener(notifyListeners);
  }

  void _init() {
    _songs = songRepository.fetchSongs();
  }

  void play(Song song) {
    playerState.start(song);
  }
  
  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }
}
