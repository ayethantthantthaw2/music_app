import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/src/app_spacings.dart';

class PlayOrShuffleSwitch extends StatelessWidget {
  const PlayOrShuffleSwitch(
      {super.key, required this.isPlay, required this.onSwitch});

  final bool isPlay;
  final VoidCallback onSwitch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSwitch,
      child: Container(
        height: 50,
        width: Get.size.width,
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              left: isPlay ? 0 : Get.size.width * 0.45,
              duration: const Duration(milliseconds: 100),
              child: Container(
                height: 46,
                margin: const EdgeInsets.all(2.0),
                width: Get.size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade400,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Play',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: isPlay
                                      ? Colors.white
                                      : Colors.deepPurple),
                        ),
                      ),
                      const SizedBox(
                        width: AppSpacing.s,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : Colors.deepPurple,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Shuffle',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: isPlay
                                      ? Colors.deepPurple
                                      : Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: AppSpacing.s,
                      ),
                      Icon(
                        Icons.shuffle_sharp,
                        color: isPlay ? Colors.deepPurple : Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
