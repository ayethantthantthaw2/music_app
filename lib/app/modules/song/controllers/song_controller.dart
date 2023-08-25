import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/app/data/models/song_model.dart';

class SongController extends GetxController {
  late List<Song> songs; // List<AudioSource> var;
  late int index;
  AudioPlayer audioPlayer = AudioPlayer();
  Rx<Duration> currentPosition = Duration.zero.obs;
  Rx<Duration> totalDuration = Duration.zero.obs;
  RxBool isPlaying = false.obs;
  final _isHasNext = true.obs;

  bool get isHasNext => _isHasNext.value;

  set isHasNext(value) {
    _isHasNext.value = value;
  }

  final _isHasPrevious = true.obs;

  bool get isHasPrevious => _isHasPrevious.value;

  set isHasPrevious(value) {
    _isHasPrevious.value = value;
  }

  final _selectedSong = Rxn<Song>();

  Song? get selectedSong => _selectedSong.value;

  set selectedSong(value) {
    _selectedSong.value = value;
  }

  @override
  Future<void> onInit() async {
    getSongs();
    selectedSong = Get.arguments;
    index = songs.indexWhere((element) => selectedSong?.title == element.title);
    if (index == 0) {
      isHasPrevious = false;
    } else if (index == songs.length - 1) {
      isHasNext = false;
    }
    getAudios();
    getPositionUpdate();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> getAudios() async {
    final playlist = ConcatenatingAudioSource(
        children: songs
            .map((song) =>
                AudioSource.uri(Uri.parse('asset:///${song.url ?? ""}')))
            .toList());
    await audioPlayer.setAudioSource(playlist,
        initialIndex: index, initialPosition: Duration.zero);
    totalDuration.value = audioPlayer?.duration ?? const Duration(seconds: 0);
  }

  void getPositionUpdate() {
    audioPlayer.positionStream.listen((position) async {
      currentPosition.value = position;
      if (currentPosition != Duration.zero &&
          currentPosition == totalDuration) {
        await audioPlayer.stop();
      }
    });
  }

  seekToPosition(Duration position) {
    getPositionUpdate();
    audioPlayer.seek(position);
  }

  String formatDuration(Duration duration) {
    if (duration == null) {
      return '--:--';
    } else {
      String minutes = duration.inMinutes.toString().padLeft(2, '0');
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }
  }

  Future<void> playAudio() async {
    totalDuration.value = audioPlayer?.duration ?? const Duration(seconds: 0);
    await audioPlayer.play();
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  void onClickPlayButton() {
    if (audioPlayer.playerState.playing) {
      pauseAudio();
      isPlaying.value = false;
    } else {
      playAudio();
      isPlaying.value = true;
    }
  }

  void playNext() async {
    if (audioPlayer.hasNext) {
      isHasNext = true;
      isHasPrevious = true;
      await audioPlayer.seekToNext();
      selectedSong = songs[audioPlayer?.currentIndex ?? 0];
    } else {
      isHasNext = false;
    }
  }

  void playPrevious() async {
    if (audioPlayer.hasPrevious) {
      isHasPrevious = true;
      isHasNext = true;
      await audioPlayer.seekToPrevious();
      selectedSong = songs[audioPlayer?.currentIndex ?? 0];
    } else {
      isHasPrevious = false;
    }
  }

  getSongs() {
    songs = [
      Song(
          title: 'Seven',
          description: 'BTS',
          url: 'assets/music/seven.mp3',
          coverUrl: 'assets/images/seven.jpeg'),
      Song(
          title: 'Super Shy',
          description: 'New Jeans',
          url: 'assets/music/supershy.mp3',
          coverUrl: 'assets/images/super_shy.jpg'),
      Song(
          title: 'Playing With Fire',
          description: 'Black Pink',
          url: 'assets/music/playingwithfire.mp3',
          coverUrl: 'assets/images/playing_with_fire.jpeg'),
    ];
  }
}
