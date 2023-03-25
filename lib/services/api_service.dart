import 'dart:convert';

import 'package:http/http.dart';
import 'package:webtoon/models/webtoon.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonList = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonList;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonbyId(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getEpisodebyId(String id) async {
    List<WebtoonEpisodeModel> episodeList = [];

    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeList.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodeList;
    }
    throw Error();
  }
}
