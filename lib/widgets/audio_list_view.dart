import 'package:evince_test/utils/constants.dart';
import 'package:evince_test/screens.dart/details_page.dart';
import 'package:evince_test/data/main_page_data.dart';
import 'package:evince_test/screens.dart/main_screen.dart';
import 'package:evince_test/widgets/audio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioListView extends ConsumerWidget {
  const AudioListView(
      {super.key,
      required this.deviceHeight,
      required this.deviceWidth,
      required this.mainPageData});
  final double deviceHeight, deviceWidth;
  final MainPageData mainPageData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: deviceHeight * 0.83,
      padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.01),
      child: mainPageData.status == Status.success
          ? ListView.builder(
              itemCount: mainPageData.audios!.length,
              itemBuilder: (BuildContext context, int index) {
                final audio = mainPageData.audios![index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: deviceHeight * 0.01, horizontal: 0),
                  child: GestureDetector(
                    onTap: () {
                      String backGroundImage = ref
                          .read(selectedAudioPosterUrlProvider.notifier)
                          .state = audio.imageUrl;
                      Navigator.pushNamed(context, DetailPage.route,
                          arguments: {
                            'image': backGroundImage,
                            'deviceWidth': deviceWidth,
                            'deviceHeight': deviceHeight,
                            'audio': audio,
                          });
                    },
                    child: AudioTile(
                        height: deviceHeight * 0.2,
                        width: deviceWidth * 0.85,
                        audio: audio),
                  ),
                );
              })
          : mainPageData.status == Status.loading
              ? const Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.white),
                )
              : Center(
                  child: Text(
                  mainPageData.error!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  softWrap: true,
                )),
    );
  }
}
