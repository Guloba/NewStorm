import 'package:http/http.dart' as http;
import 'package:newstorm/models/article.dart';
import 'dart:convert';

import 'package:newstorm/secret.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=dfc09a89e7344f28807dfa0df0cdbce8";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=dfc09a89e7344f28807dfa0df0cdbce8";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
