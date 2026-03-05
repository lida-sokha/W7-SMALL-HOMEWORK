// song_repository_mock.dart

import '../../../model/songs/song.dart';
import 'song_repository.dart';

class SongRepositoryMock implements SongRepository {
  final List<Song> _songs = [
    Song(
      id: '101',
      title: 'Mock Song 1',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 2, seconds: 50),
    ),
    Song(
      id: '102',
      title: 'Mock Song 2',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
    Song(
      id: '103',
      title: 'Summer Vibes',
      artist: 'Ocean Blue',
      duration: const Duration(minutes: 4, seconds: 15),
    ),
    Song(
      id: '104',
      title: 'Midnight City',
      artist: 'Neon Lights',
      duration: const Duration(minutes: 3, seconds: 45),
    ),
    Song(
      id: '105',
      title: 'Coding Focus',
      artist: 'Lofi Girl',
      duration: const Duration(minutes: 5, seconds: 0),
    ),
    Song(
      id: '106',
      title: 'Mountain Top',
      artist: 'Nature Sounds',
      duration: const Duration(minutes: 2, seconds: 30),
    ),
  ];

  @override
  List<Song> fetchSongs() {
    return _songs;
  }

  @override
  Song? fetchSongById(String id) {
    try {
      return _songs.firstWhere((song) => song.id == id);
    } catch (_) {
      return null;
    }
  }
}
