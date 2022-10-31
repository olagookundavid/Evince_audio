import 'package:evince_test/data/audio.dart';
import 'package:flutter/material.dart';

class AudioInfo extends StatelessWidget {
  const AudioInfo(
      {super.key,
      required this.height,
      required this.width,
      required this.audio});
  final double height, width;
  final Audio audio;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width * 0.66,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //width .56
              Text(
                audio.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, height * 0.07, 0, 0),
                child: Text(audio.description,
                    maxLines: 9,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 12)),
              )
            ]),
      ),
    );
  }
}
