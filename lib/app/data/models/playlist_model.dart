import 'package:music_app/app/data/models/song_model.dart';

class Playlist {
  final int id;
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({required this.id,required this.title, required this.songs, required this.imageUrl});
}
