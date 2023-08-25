import 'package:flutter/material.dart';
import 'package:music_app/app/widgets/playlist_card_widget.dart';

import '../data/models/playlist_model.dart';

class PlayListWidget extends StatelessWidget {
  const PlayListWidget({super.key, required this.playlist});

  final List<Playlist> playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return PlayListCardWidget(playlist: playlist[index]);
      },
      itemCount: playlist?.length ?? 0,
      scrollDirection: Axis.vertical,
    );
  }
}
