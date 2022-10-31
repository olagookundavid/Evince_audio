import 'package:evince_test/data/audio.dart';
import 'package:evince_test/utils/constants.dart';

class MainPageData {
  final List<Audio>? audios;
  final String? error;
  final Status status;

  MainPageData(
    this.audios,
    this.error,
    this.status,
  );
  MainPageData.initial()
      : audios = [],
        error = '',
        status = Status.loading;

  MainPageData copyWith({
    List<Audio>? audios,
    String? error,
    Status? status,
  }) {
    return MainPageData(
      audios ?? this.audios,
      error ?? this.error,
      status ?? this.status,
    );
  }
}
