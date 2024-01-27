// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_analysis_design/core/widget/main_wrapper.dart';
import 'package:news_analysis_design/features/feature_favorite/presentation/bloc/news_bloc.dart';
import 'features/feature_main_page/presentation/bloc/news_bloc.dart';
import 'locator.dart';

Future<void> main() async {
  await setup();
  MyWidget myWidget = MyWidget();

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteNewsBloc>(create: (context) => locator<FavoriteNewsBloc>()),
        BlocProvider<NewsBloc>(create: (context) => locator<NewsBloc>())
      ],
      child: myWidget
  ));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}

