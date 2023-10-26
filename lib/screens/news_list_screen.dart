import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list_task/bloc/all_news_bloc/all_news_bloc.dart';
import 'package:news_list_task/const/colors.dart';
import 'package:news_list_task/repo/models/article.dart';
import 'package:news_list_task/screens/one_new_screen.dart';
import 'package:news_list_task/widgets/custom_app_bar_widget.dart';
import 'package:news_list_task/widgets/featured_news_widget.dart';
import 'package:news_list_task/widgets/latest_news_item_widget.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    BlocProvider.of<AllNewsBloc>(context).add(GettingAllArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNewsBloc, AllNewsState>(
      builder: (context, state) {
        return getNewsListScreenWidget(state);
      },
    );
  }

  Widget getNewsListScreenWidget(AllNewsState state) {
    Widget newsListScreenWidget = const SizedBox();

    if (state is AllNewsLoading) {
      newsListScreenWidget = const Scaffold(
        backgroundColor: AppColors.appbackgroundcolor,
        body: Center(
          child: SizedBox(
            height: 60.0,
            width: 60.0,
            child: CircularProgressIndicator(
              color: AppColors.textcolor,
              backgroundColor: Colors.transparent,
              strokeWidth: 5.0,
            ),
          ),
        ),
      );
    } else if (state is AllNewsError) {
      newsListScreenWidget = const Scaffold(
        backgroundColor: AppColors.appbackgroundcolor,
        body: Center(
          child: Text(
            'Network error',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      );
    } else if (state is AllNewsSuccess) {
      List<Article> latestArticles =
          BlocProvider.of<AllNewsBloc>(context).latestArticles;
      List<Article> featuredArticles =
          BlocProvider.of<AllNewsBloc>(context).featuredArticles;

      newsListScreenWidget = Scaffold(
        backgroundColor: AppColors.appbackgroundcolor,
        appBar: AppBar(
          toolbarHeight: 68,
          elevation: 0,
          backgroundColor: AppColors.appbackgroundcolor,
          flexibleSpace: CustomAppBarWidget(
            onTapReaded: () {
              BlocProvider.of<AllNewsBloc>(context).add(ReadAllArticlesEvent());
            },
          ),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 28.0),
                        child: Text(
                          'Featured',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 340.0,
                        child: PageView.builder(
                          itemCount: featuredArticles.length,
                          itemBuilder: (context, index) {
                            return FeaturedNewsItemWidget(
                              title: featuredArticles[index].title,
                              image: featuredArticles[index].imageUrl,
                              readed: featuredArticles[index].readed,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OneNewScreen(
                                      articleId: featuredArticles[index].id,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 28.0),
                        child: Text(
                          'Latest News',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        shrinkWrap: true,
                        itemCount: latestArticles.length,
                        itemBuilder: (context, index) {
                          var differenceTime = DateTime.now()
                              .difference(latestArticles[index].publicationDate)
                              .inDays;
                          return LatestNewsItemWidget(
                            image: latestArticles[index].imageUrl,
                            title: latestArticles[index].title,
                            publicationDate: differenceTime,
                            readed: latestArticles[index].readed,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OneNewScreen(
                                    articleId: latestArticles[index].id,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocProvider.of<AllNewsBloc>(context).loading
                ? Container(
                    color: AppColors.appbackgroundcolor.withOpacity(0.2),
                    child: const Center(
                      child: SizedBox(
                        height: 60.0,
                        width: 60.0,
                        child: CircularProgressIndicator(
                          color: AppColors.textcolor,
                          backgroundColor: Colors.transparent,
                          strokeWidth: 5.0,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    }

    return newsListScreenWidget;
  }
}
