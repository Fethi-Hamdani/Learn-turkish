import 'dart:io';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Audio {
  final String start_recording_file = "start.wav";
  final String stop_recording_file = "stop.wav";
  AudioCache audioPlayer = AudioCache();

  Future<bool> start_recording(String path) async {
    if (await Permission.microphone.request().isGranted) {
      Directory p = await getApplicationDocumentsDirectory();
      String pth = p.path + path;
      await AudioRecorder.start(
          path: pth, audioOutputFormat: AudioOutputFormat.AAC);
      audioPlayer.play(start_recording_file).whenComplete(() {
        return true;
      });
    }
  }

  stop_recording() async {
    Recording recording = await AudioRecorder.stop();
    audioPlayer.play(stop_recording_file).whenComplete(() {});
  }

  delete_record(String path) async {
    Directory p = await getApplicationDocumentsDirectory();
    String pth = p.path + path + ".m4a";
    try {
      if (await File(pth).exists()) File(pth).deleteSync();
    } catch (e) {}
  }
}
