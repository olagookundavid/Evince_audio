import 'package:evince_test/data/audio.dart';
import 'package:evince_test/widgets/background_widget.dart';
import 'package:evince_test/widgets/details_fore_ground.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailPage extends StatefulWidget {
  static const String route = '/details_page';
  const DetailPage(
      {Key? key,
      required this.image,
      required this.deviceWidth,
      required this.deviceHeight,
      required this.audio})
      : super(key: key);
  final String image;
  final double deviceWidth, deviceHeight;
  final Audio audio;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              BackGroundWidget(
                deviceHeight: widget.deviceHeight,
                selectedAudioPosterUrl: widget.image,
                deviceWidth: widget.deviceWidth,
              ),
              DetailForeGround(
                  audio: widget.audio,
                  deviceHeight: widget.deviceHeight,
                  deviceWidth: widget.deviceWidth),
            ],
          ),
        ),
      ),
    );
  }
}
