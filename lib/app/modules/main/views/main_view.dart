import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/modules/home/views/home_view.dart';
import 'package:music_app/app/widgets/audio_player_widget.dart';
import '../../../widgets/custom_bottom_navigation_bar.dart';
import '../controllers/main_controller.dart';
import 'package:miniplayer/miniplayer.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            bottomNavigationBar:
                const SizedBox(height: 70, child: CustomBottomNavigationBar()),
            body: PageView(
              controller: controller.pageController,
              children: const [
                HomeView(),
              ],
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 70,
          child: Miniplayer(
              minHeight: 70,
              maxHeight: Get.height,
              builder: (height, percentage) {
                return const Center(
                  child: AudioPlayerWidget(), //Text('$height, $percentage')
                );
              }),
        )
      ],
    );
  }
}
