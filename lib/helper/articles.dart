import 'dart:convert';
import 'package:elgoog/model/article_model.dart';
import 'package:http/http.dart' as http;

class Articles{
  List<ArticleModel> articles = [];

  Future<void> getArticles() async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=8907d6909bc9401daba25bd8c34e5e1a';
    var res = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(res.body.toString());

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['description'] != null) {
           ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          articles.add(article);
        }
      });
    }
  }
}