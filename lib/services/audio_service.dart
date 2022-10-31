// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:evince_test/data/failure.dart';
import 'package:evince_test/services/http_service.dart';

import '../data/audio.dart';

class AudioService {
  final HTTPService http;
  AudioService({
    required this.http,
  });

  Future<List<Audio>> getAudios() async {
    try {
      //Should be in a secure Storage
      const String baseUrl = 'https://media.abeti.xyz/api/v1/media-list';
      Map<String, dynamic> header = {
        'Content-Type': "application/json",
        'Accept': "application/json",
      };
      Response response =
          await http.get(baseUrl, options: Options(headers: header));

      if (response.statusCode == 200) {
        var data = response.data;
        List<Audio> audios = data.map<Audio>((movieData) {
          return Audio.fromJson(movieData);
        }).toList();
        return audios;
      } else {
        throw Failure(message: 'Request not sent, Please Try Again');
      }
    } on SocketException {
      throw Failure(message: 'Request not sent, No Internet');
    } on HttpException {
      throw Failure(message: 'Request not sent, Request Error');
    } catch (e) {
      throw Failure(message: 'Request not sent, Please Try Again');
    }
  }
}
