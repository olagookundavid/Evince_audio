import 'package:dio/dio.dart';

class HTTPService {
  final Dio dio;

  HTTPService({required this.dio});

  Future<Response> get(String url, {Options? options}) async {
    try {
      return await dio.get(url, options: options);
    } catch (e) {
      rethrow;
    }
  }
}
