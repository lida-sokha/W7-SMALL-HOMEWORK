import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theory_lesson/W7-SMALL-HOMEWORK/ui/screens/home/view_model/home_view_model.dart';
import '../../../states/settings_state.dart';
import '../../../../model/songs/song.dart';
import '../../../theme/theme.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final settingsState = context.read<AppSettingsState>();
    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),
          SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("Your recently songs", style: AppTextStyles.label),
          ),
          ...viewModel.recentSongs.map(
            (song) => SongTile(
              song: song,
              isPlaying: viewModel.isSongPlaying(song),
              onTap: () => viewModel.play(song),
              onStop: () => viewModel.stop(),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("You might also like", style: AppTextStyles.label),
          ),
          ...viewModel.recommendedSongs.map(
            (song) => SongTile(
              song: song,
              isPlaying: viewModel.isSongPlaying(song),
              onTap: () => viewModel.play(song),
              onStop: () => viewModel.stop(),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
    required this.onStop,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: isPlaying
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "playing",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: onStop, child: const Text("STOP")),
              ],
            )
          : null,
    );
  }
}
