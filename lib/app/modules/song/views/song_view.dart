import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/widgets/audio_player_widget.dart';
import '../../../widgets/background_filter_widget.dart';
import '../controllers/song_controller.dart';

class SongView extends GetView<SongController> {
  const SongView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Obx(() => BackgroundFilterWidget(song: controller.selectedSong!)),
          const AudioPlayerWidget(),
        ],
      ),
    );
  }
}
