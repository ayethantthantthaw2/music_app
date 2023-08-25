import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/routes/app_pages.dart';
import '../data/models/playlist_model.dart';
import '../src/app_sizes.dart';
import '../src/app_spacings.dart';
import 'custom_image_widget.dart';

class PlayListCardWidget extends StatelessWidget {
  const PlayListCardWidget({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PLAYLIST, arguments: playlist);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.s),
        padding: const EdgeInsets.all(AppSpacing.xs),
        height: AppSizes.x6l,
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: playlist.id,
                child: CustomImageWidget(
                  image: playlist?.imageUrl ?? "",
                  type: ImageFileType.network,
                  width: AppSizes.x3l,
                  height: AppSizes.x3l,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: AppSpacing.s,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlist.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("${playlist.songs.length} Songs",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          )),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
