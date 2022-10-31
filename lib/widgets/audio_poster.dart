import 'package:flutter/material.dart';

class AudioPoster extends StatelessWidget {
  const AudioPoster(
      {Key? key,
      required this.height,
      required this.width,
      required this.imageUrl})
      : super(key: key);
  final double height, width;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
      ),
    );
  }
}
