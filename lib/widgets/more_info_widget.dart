import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:evince_test/services/audio_download_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:evince_test/data/audio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class MoreInfoWidget extends ConsumerStatefulWidget {
  const MoreInfoWidget(
      {super.key,
      required this.deviceWidth,
      required this.deviceHeight,
      required this.audio});

  final double deviceWidth, deviceHeight;
  final Audio audio;

  @override
  ConsumerState<MoreInfoWidget> createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends ConsumerState<MoreInfoWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = event == PlayerState.playing;
        });
      }
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.setSourceUrl(widget.audio.audioUrl);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.deviceWidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: isPlaying ? 'Pause' : 'Play',
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
                IconButton(
                    tooltip: 'Download Audio File',
                    onPressed: () {
                      ref.read(audioDownloadProvider).openFile(
                          widget.audio.audioUrl, '${widget.audio.title}.MP4');
                    },
                    icon: const Icon(
                      Icons.download_for_offline_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, widget.deviceHeight * 0.03, 15, 0),
            child: Text(
              widget.audio.title,
              softWrap: true,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, widget.deviceHeight * 0.03, 15, 0),
            child: Text(widget.audio.description,
                style: const TextStyle(color: Colors.white70, fontSize: 20)),
          )
        ],
      ),
    );
  }

  Future openFile(String url, String fileName) async {
    final file = await downloadFile(url, fileName);
    if (file != null) {
      OpenFile.open(file.path);
    }
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }
}
