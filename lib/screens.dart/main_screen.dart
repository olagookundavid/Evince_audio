import 'package:evince_test/data/main_page_data.dart';
import 'package:evince_test/view_model/main_page_controller.dart';
import 'package:evince_test/widgets/background_widget.dart';
import 'package:evince_test/widgets/fore_ground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController, MainPageData>((ref) {
  return MainPageDataController();
});

var selectedAudioPosterUrlProvider = StateProvider<String?>((ref) {
  final audios = ref.watch(mainPageDataControllerProvider).audios;
  return audios!.isNotEmpty ? audios[0].imageUrl : null;
});

class MainMobilePage extends ConsumerStatefulWidget {
  static const String route = 'main_screen';
  const MainMobilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainMobilePage> createState() => _MainMobilePageState();
}

class _MainMobilePageState extends ConsumerState<MainMobilePage> {
  late double deviceHeight;
  late double deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    final mainPageData = ref.watch(mainPageDataControllerProvider);
    final selectedAudioPosterUrl = ref.watch(selectedAudioPosterUrlProvider);

    return RefreshIndicator(
      onRefresh: () =>
          ref.read(mainPageDataControllerProvider.notifier).getAudios(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: SizedBox(
            height: deviceHeight,
            width: deviceWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BackGroundWidget(
                    deviceHeight: deviceHeight,
                    deviceWidth: deviceWidth,
                    selectedAudioPosterUrl: selectedAudioPosterUrl),
                ForeGround(
                    deviceHeight: deviceHeight,
                    deviceWidth: deviceWidth,
                    mainPageData: mainPageData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
