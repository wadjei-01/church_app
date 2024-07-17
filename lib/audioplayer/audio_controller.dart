import 'package:get/get.dart';
import 'package:gtp_app/audioplayer/audiomodel.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  Audio audio = Get.arguments;
  final _player = AudioPlayer();

  Future<void> _init() async {
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await _player.setAudioSource(AudioSource.uri(Uri.parse(audio.url)));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
