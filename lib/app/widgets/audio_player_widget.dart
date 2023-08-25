import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/src/app_sizes.dart';
import 'package:music_app/app/src/app_spacings.dart';
import '../modules/song/controllers/song_controller.dart';

class AudioPlayerWidget extends GetView<SongController> {
  const AudioPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(
            right: AppSpacing.d, left: AppSpacing.d, bottom: AppSizes.x5l),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.selectedSong!.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: AppSpacing.xs,
            ),
            Text(controller.selectedSong!.description,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    )),
            const SizedBox(
              height: AppSpacing.m,
            ),
            Row(
              children: [
                Text(
                  controller.formatDuration(controller.currentPosition.value),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                Expanded(
                  child: SliderTheme(
                      data: Theme.of(context).sliderTheme.copyWith(
                            trackHeight: AppSizes.xs,
                            thumbShape: const RoundSliderThumbShape(
                              disabledThumbRadius: AppSizes.xs,
                              enabledThumbRadius: 4.0,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 10.0),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white.withOpacity(0.2),
                            thumbColor: Colors.white,
                          ),
                      child: Slider(
                        min: 0.0,
                        max:
                            controller.totalDuration.value.inSeconds.toDouble(),
                        value: controller.currentPosition.value.inSeconds
                            .toDouble(),
                        onChanged: (value) {
                          controller
                              .seekToPosition(Duration(seconds: value.toInt()));
                        },
                      )),
                ),
                Text(
                  controller.formatDuration(controller.totalDuration.value),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: controller.playPrevious,
                    icon: Icon(
                      Icons.skip_previous,
                      color:
                          controller.isHasPrevious ? Colors.white : Colors.grey,
                    )),
                IconButton(
                    iconSize: AppSizes.x4l,
                    onPressed: controller.onClickPlayButton,
                    icon: controller.currentPosition != Duration.zero &&
                            controller.currentPosition ==
                                controller.totalDuration
                        ? const Icon(
                            Icons.replay_circle_filled,
                            color: Colors.white,
                          )
                        : controller.isPlaying.value == false
                            ? const Icon(
                                Icons.play_circle_filled,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.pause_circle_filled,
                                color: Colors.white,
                              )),
                IconButton(
                    onPressed: controller.playNext,
                    icon: Icon(
                      Icons.skip_next,
                      color: controller.isHasNext ? Colors.white : Colors.grey,
                    )),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: controller.playNext,
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: controller.playNext,
                    icon: const Icon(
                      Icons.cloud_download_outlined,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
