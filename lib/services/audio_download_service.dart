import 'dart:io';
import 'package:evince_test/services/http_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';

final audioDownloadProvider = Provider((ref) {
  return DownloadService(http: HTTPService(dio: Dio()));
});

class DownloadService {
  final HTTPService http;

  DownloadService({required this.http});
  Future openFile(String url, String fileName) async {
    final file = await downloadFile(url, fileName);
    if (file != null) {
      OpenFile.open(file.path);
    }
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      Response response = await http.get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }
}
