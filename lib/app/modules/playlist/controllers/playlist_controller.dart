import 'package:get/get.dart';
import 'package:music_app/app/data/models/playlist_model.dart';
import 'package:music_app/app/modules/home/controllers/home_controller.dart';

class PlaylistController extends GetxController {
  late Playlist playlist;
  final _isPlay = true.obs;
  HomeController homeController = Get.find<HomeController>();

  bool get isPlay => _isPlay.value;

  set isPlay(value) {
    _isPlay.value = value;
  }

  @override
  void onInit() {
    playlist = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSwitch() {
    isPlay = !isPlay;
  }
}
