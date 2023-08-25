import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/routes/app_pages.dart';
import 'package:music_app/app/src/app_spacings.dart';
import '../data/models/song_model.dart';
import 'custom_image_widget.dart';

class SongCardWidget extends StatelessWidget {
  const SongCardWidget({
    super.key,
    required this.song,

  });

  final Song song;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.SONG, arguments: song);
      },
      child: Container(
        margin: const EdgeInsets.only(right: AppSpacing.s),
        child: Stack(
          fit: StackFit.loose,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: song.title ?? "",
                child: CustomImageWidget(
                  image: song.coverUrl ?? "",
                  type: ImageFileType.assets,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: AppSpacing.s,
              right: AppSpacing.s,
              child: Container(
                padding: const EdgeInsets.only(left: AppSpacing.m),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white60),
                height: 50,
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              song.description ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_circle_filled,
                          color: Colors.deepPurple,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
