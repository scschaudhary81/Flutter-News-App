import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import '../views/home.dart';
import '../modelappdata/maindata.dart';

class CategoryNews extends StatefulWidget {
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
  final String cat;

  CategoryNews({this.cat});
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> article = List();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryNewsClass news = CategoryNewsClass(cat: widget.cat.toLowerCase());
    await news.getNews();
    article = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.share_rounded),
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.cat),
            Text(
              'News',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 16.0),
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: article.length,
                          itemBuilder: (context, index) {
                            return MainTile(
                              url: article[index].url,
                              imageUrl: article[index].urlToImage,
                              title: article[index].title,
                              description: article[index].description,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
