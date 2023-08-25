import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/widgets/song_card_widget.dart';

import '../data/models/song_model.dart';

class TrendingMusicListWidget extends StatelessWidget {
  const TrendingMusicListWidget({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.width * 0.45,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: songs?.length,
          itemBuilder: (context, index) {
            return SongCardWidget(
              song: songs[index],
            );
          }),
    );
  }
}
