import 'package:get/get.dart';
import 'package:music_app/app/modules/home/controllers/home_controller.dart';
import 'package:music_app/app/modules/playlist/controllers/playlist_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PlaylistController>(
      () => PlaylistController(),
    );
  }
}