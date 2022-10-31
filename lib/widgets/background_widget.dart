import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget(
      {super.key,
      required this.selectedAudioPosterUrl,
      required this.deviceHeight,
      required this.deviceWidth});
  final String? selectedAudioPosterUrl;
  final double deviceHeight, deviceWidth;
  @override
  Widget build(BuildContext context) {
    if (selectedAudioPosterUrl != null) {
      return Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  selectedAudioPosterUrl!,
                ),
                fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
        ),
      );
    } else {
      return Container(
        height: deviceHeight,
        width: deviceWidth,
        color: Colors.black,
      );
    }
  }
}
