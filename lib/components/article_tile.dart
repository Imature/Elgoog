import 'package:elgoog/views/article_detail.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final imageUrl, title, desc, author, url;

  ArticleTile(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.author,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetail(articleUrl: url,)));
      },
      child: Container(
        child: Card(
          color: Color(0xff313236),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
                SizedBox(height: 5,),
                Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
                SizedBox(height: 5,),
                Text(desc, style: TextStyle(fontSize: 14, color: Colors.white), maxLines: 3,),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(child: Text("By ", style: TextStyle(color: Colors.white),)),
                    Flexible(child: Text(author, style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis,),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}