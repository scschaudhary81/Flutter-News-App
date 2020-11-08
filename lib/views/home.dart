import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/modelappdata/listdata.dart';
import 'package:news_app/modelappdata/maindata.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = List<CategoryModel>();
  List<ArticleModel> article = List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    category = getCategories();
    getNews();
  }

  getNews() async {
    News news = News();
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daily'),
            Text(
              'News',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // for the upper row
                    Container(
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: category.length,
                          itemBuilder: (ctx, index) {
                            return CategoryTile(
                              categoryName: category[index].categoryName,
                              imageUrl: category[index].imageUrl,
                            );
                          }),
                    ),
                    //for the news articles
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

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CategoryNews(cat: categoryName,)));
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (ctx, animation, secAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                scale: animation,
                alignment: Alignment.topCenter,
                child: child,
              );
            },
            pageBuilder: (ctx, animation, secAnimation) {
              return CategoryNews(cat: categoryName);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;

  MainTile({
    @required this.imageUrl,
    @required this.description,
    @required this.title,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleView(url:url,title: title,)));
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (ctx, animation, secAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutCirc);
              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.bottomCenter,
              );
            },
            pageBuilder: (ctx, animation, secAnimation) {
              return ArticleView(
                url: url,
                title: title,
              );
            }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(imageUrl),
              borderRadius: BorderRadius.circular(6),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
