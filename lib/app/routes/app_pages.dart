import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/playlist/bindings/playlist_binding.dart';
import '../modules/playlist/views/playlist_view.dart';
import '../modules/song/bindings/song_binding.dart';
import '../modules/song/views/song_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SONG,
      page: () => const SongView(),
      binding: SongBinding(),
    ),
    GetPage(
      name: _Paths.PLAYLIST,
      page: () => const PlaylistView(),
      binding: PlaylistBinding(),
    ),
  ];
}
