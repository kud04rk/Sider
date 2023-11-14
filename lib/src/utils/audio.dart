import 'dart:io';

import 'package:audioplayers/audioplayers.dart';


playAudio(String url) {
  if (Platform.isIOS) {
    AudioCache audioCache = AudioCache();
    try {
      audioCache.load(url);
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
