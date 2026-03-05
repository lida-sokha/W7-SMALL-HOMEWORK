import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theory_lesson/W7-SMALL-HOMEWORK/ui/screens/library/view_model/library_view_model.dart';
import 'package:theory_lesson/W7-SMALL-HOMEWORK/ui/screens/library/widget/library_content.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(
        songRepository: context.read<SongRepository>(),
        playerState: context.read<PlayerState>(),
      ),
      child: const LibraryContent(),
    );
  }
}
