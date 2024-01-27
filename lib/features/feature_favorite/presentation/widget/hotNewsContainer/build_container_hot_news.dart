import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_analysis_design/features/feature_favorite/domain/entities/favorite_entity.dart';
import 'package:news_analysis_design/features/feature_favorite/presentation/bloc/news_bloc.dart';
import 'package:news_analysis_design/features/feature_favorite/presentation/bloc/news_state.dart';
import 'package:news_analysis_design/features/feature_favorite/presentation/widget/view_news_page.dart';

import 'container_hot_news.dart';

class BuildHotNewsContainer extends StatefulWidget {
  const BuildHotNewsContainer({Key? key}) : super(key: key);

  @override
  State<BuildHotNewsContainer> createState() => _BuildHotNewsContainerState();
}

class _BuildHotNewsContainerState extends State<BuildHotNewsContainer> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   BlocProvider.of<FavoriteNewsBloc>(context).add(GetFavoriteNewsList());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteNewsBloc, NewsState>(
      listener: (context, state) {
        if (state is NewsError) {
          Text(state.message!);
        }
      },
      child: BlocBuilder<FavoriteNewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            return _buildLoading();
          } else if (state is NewsLoading) {
            return _buildLoading();
          } else if (state is NewsLoaded) {
            return containerBuilder(context, state.newsModel);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Padding containerBuilder(BuildContext context, List<FavoriteEntity> newsModel) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 20),
      child: SizedBox(
        height: 326,
        child: ListView.builder(
          reverse: true,
          itemCount: newsModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: HotNewsContainer(
                  author: newsModel[index].title!.toString(),
                  title: newsModel[index].title!,
                  describe: newsModel[index].description!,
                  imageUrl: newsModel[index].imageUrl.toString(),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewNews(
                      author: newsModel[index].description!,
                      title: newsModel[index].title!,
                      describe: newsModel[index].url!,
                      imageUrl: newsModel[index].imageUrl.toString(),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
