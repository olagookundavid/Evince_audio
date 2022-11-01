import 'package:evince_test/data/audio.dart';
import 'package:evince_test/widgets/more_info_widget.dart';
import 'package:flutter/material.dart';

class DetailForeGround extends StatelessWidget {
  const DetailForeGround(
      {super.key,
      required this.deviceWidth,
      required this.deviceHeight,
      required this.audio});

  final double deviceWidth, deviceHeight;
  final Audio audio;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: deviceHeight / 1.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: (NetworkImage(audio.imageUrl)), fit: BoxFit.fill)),
          ),
          MoreInfoWidget(
              audio: audio,
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth)
        ],
      ),
    );
  }
}
