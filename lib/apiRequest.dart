import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

late final List<Anime> animesListe;
Future<List<Anime>> getAnime() async {
  var url = Uri.https('api.jikan.moe', '/v4/anime');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    var t = jsonResponse['data'];

    for (var item in t) {
      var anime = Anime.fromJson(item);
      animesListe.add(anime);
    }
  }

  return animesListe;
}

class Anime {
  final int id;
  final String url;
  final String imageUrl;
  final String title;
  final String? trailerUrl;
  final String type;
  final int? episodes;
  final String status;
  final String synopsis;

  Anime(this.id, this.url, this.imageUrl, this.title, this.trailerUrl,
      this.type, this.episodes, this.status, this.synopsis);

  Anime.fromJson(Map<String, dynamic> json)
      : id = json['mal_id'],
        url = json['url'],
        imageUrl = json['images']['jpg']['image_url'],
        title = json['title'],
        trailerUrl = json['trailer']['embed_url'],
        type = json['type'],
        episodes = json['episodes'],
        status = json['status'],
        synopsis = json['synopsis'];
}
