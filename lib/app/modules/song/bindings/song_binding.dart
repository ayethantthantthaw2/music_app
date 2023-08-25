import 'package:get/get.dart';

import '../controllers/song_controller.dart';

class SongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongController>(
      () => SongController(),
    );
  }
}
