import 'package:get/get.dart';
import 'package:music_app/app/data/models/song_model.dart';

import '../../../data/models/playlist_model.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  List<Song>? songs;
  List<Playlist>? playlists;

  @override
  void onInit() {
    getSongs();
    getPlaylists();
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

  getSongs() {
    songs = [
      Song(
          title: 'Butterfly',
          description: 'Blush',
          url: 'assets/music/butterfly.mp3',
          coverUrl: 'assets/images/butterfly.jpg'),
      Song(
          title: 'Radio',
          description: 'Lu Hpring',
          url: 'assets/music/radio.mp3',
          coverUrl: 'assets/images/radio.jpg'),
      Song(
          title: 'A Yan Lwan Nay P',
          description: 'May',
          url: 'assets/music/AYanLwanNayP.mp3',
          coverUrl: 'assets/images/ayanlwannayp.jpg'),
    ];
  }

  getPlaylists() {
    playlists = [
      Playlist(
          id: 1,
          title: 'K-POP',
          songs: songs ?? [],
          imageUrl:
              "https://www.imperialcollegeunion.org/dbfile/190882/image.jpg"),
      Playlist(
          id: 2,
          title: 'Hip-Hop',
          songs: songs ?? [],
          imageUrl:
              "https://static.vecteezy.com/system/resources/previews/006/470/700/original/hip-hop-free-vector.jpg"),
      Playlist(
          id: 3,
          title: 'Rock & Roll',
          songs: songs ?? [],
          imageUrl:
              "https://img.freepik.com/premium-vector/rock-n-roll-guitar-electric-rock-musicians-logo-design_284881-284.jpg?w=2000")
    ];
  }
}
