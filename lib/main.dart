import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list_task/bloc/all_news_bloc/all_news_bloc.dart';
import 'package:news_list_task/screens/news_list_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const NewsListApp());
}

class NewsListApp extends StatelessWidget {
  const NewsListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News List',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AllNewsBloc>(create: (context) => AllNewsBloc()),
          // BlocProvider<GetOneNewBloc>(create: (context) => GetOneNewBloc()),
        ],
        child: const NewsListScreen(),
      ),
    );
  }
}
