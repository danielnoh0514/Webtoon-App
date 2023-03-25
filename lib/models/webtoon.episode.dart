import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  final String webtoonId;

  Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  WebtoonEpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    onButtonTap() async {
      final url = Uri.parse(
          "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
      await launchUrl(url);
      print(url);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green, width: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GestureDetector(
          onTap: onButtonTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(color: Colors.green),
              ),
              const Icon(
                Icons.chevron_right_outlined,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
