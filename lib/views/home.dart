import 'package:elgoog/components/article_tile.dart';
import 'package:elgoog/helper/articles.dart';
import 'package:elgoog/model/article_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles = <ArticleModel>[];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticles();
  }

  void getArticles() async{
    Articles dataArticles = Articles();
    await dataArticles.getArticles();
    articles = dataArticles.articles;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212226),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Elgoog")
          ],
        ),
        centerTitle: true,
        elevation: 0,
        ),
        body: isLoading ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ) : SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
               Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index){
                    return ArticleTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      author: articles[index].author,
                      url: articles[index].articleUrl,
                      desc: articles[index].description
                    );
                  },
                ),
               )
              ],
            ),
          ),
        ),
    );
     
  }
}