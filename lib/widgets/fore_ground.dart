import 'package:evince_test/data/main_page_data.dart';
import 'package:evince_test/widgets/audio_list_view.dart';
import 'package:evince_test/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class ForeGround extends StatelessWidget {
  const ForeGround(
      {super.key,
      required this.deviceHeight,
      required this.deviceWidth,
      required this.mainPageData});
  final double deviceHeight, deviceWidth;
  final MainPageData mainPageData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, deviceHeight * 0.02, 0, 0),
      width: deviceWidth * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TopBar(deviceHeight: deviceHeight, deviceWidth: deviceWidth),
          AudioListView(
              mainPageData: mainPageData,
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth),
        ],
      ),
    );
  }
}
