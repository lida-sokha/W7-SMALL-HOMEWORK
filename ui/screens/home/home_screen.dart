import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theory_lesson/W7-SMALL-HOMEWORK/data/repositories/songs/song_repository.dart';
import 'package:theory_lesson/W7-SMALL-HOMEWORK/data/repositories/users/user_history_repository.dart';
import 'package:theory_lesson/W7-SMALL-HOMEWORK/ui/screens/home/view_model/home_view_model.dart';
import 'package:theory_lesson/W7-SMALL-HOMEWORK/ui/screens/home/widget/home_content.dart';
import 'package:theory_lesson/W7-SMALL-HOMEWORK/ui/states/player_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        songRepository: context.read<SongRepository>(),
        playerState: context.read<PlayerState>(),
        historyRepository: context.read<UserHistoryRepository>(),
      ),
      child: const HomeContent(),
    );
  }
}
