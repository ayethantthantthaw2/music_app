import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/routes/app_pages.dart';
import 'package:music_app/app/src/app_spacings.dart';
import 'package:music_app/app/widgets/custom_image_widget.dart';
import '../../../src/app_decorations.dart';
import '../../../widgets/play_or_shuffle_switch_widget.dart';
import '../controllers/playlist_controller.dart';

class PlaylistView extends GetView<PlaylistController> {
  const PlaylistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.gradientDecoration,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: controller.playlist.id,
                    child: CustomImageWidget(
                      image: controller.playlist.imageUrl,
                      type: ImageFileType.network,
                      width: Get.height * 0.3,
                      height: Get.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
                  child: Text(
                    controller.playlist.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Obx(
                  () => PlayOrShuffleSwitch(
                    isPlay: controller.isPlay,
                    onSwitch: controller.onSwitch,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.s),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Get.toNamed(Routes.SONG,
                              arguments:
                                  controller.homeController.songs![index]);
                        },
                        minLeadingWidth: 0,
                        leading: Padding(
                          padding: const EdgeInsets.all(AppSpacing.s),
                          child: Text(
                            '${index + 1}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          controller.homeController.songs?[index].title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          controller.homeController.songs?[index].description ??
                              "",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      );
                    },
                    itemCount: controller.homeController.songs?.length ?? 0,
                    scrollDirection: Axis.vertical,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
