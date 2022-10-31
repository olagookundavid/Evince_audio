import 'package:evince_test/data/audio.dart';
import 'package:evince_test/widgets/audio_info.dart';
import 'package:evince_test/widgets/audio_poster.dart';
import 'package:flutter/material.dart';

class AudioTile extends StatelessWidget {
  final double height;
  final double width;
  final Audio audio;

  const AudioTile(
      {Key? key,
      required this.height,
      required this.width,
      required this.audio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AudioPoster(height: height, width: width, imageUrl: audio.imageUrl),
          AudioInfo(height: height, width: width, audio: audio),
        ]);
  }
}
