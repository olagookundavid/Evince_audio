import 'package:dio/dio.dart';
import 'package:evince_test/data/audio.dart';
import 'package:evince_test/services/audio_service.dart';
import 'package:evince_test/services/http_service.dart';
import 'package:evince_test/utils/constants.dart';
import 'package:evince_test/data/main_page_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController() : super(MainPageData.initial()) {
    getAudios();
  }
  final AudioService audioService = AudioService(http: HTTPService(dio: Dio()));

  Future<void> getAudios({String? searchTerm}) async {
    try {
      state = state.copyWith(status: Status.loading);
      List<Audio> audios = await audioService.getAudios();
      if (searchTerm == null || searchTerm == '') {
        state = state.copyWith(status: Status.success, audios: audios);
      } else {
        List<Audio> filteredAudios = audios
            .where((Audio audio) =>
                audio.title.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();
        audios = filteredAudios;
        state = state.copyWith(status: Status.success, audios: audios);
      }
    } catch (e) {
      state = state.copyWith(status: Status.error, error: e.toString());
    }
  }
}
