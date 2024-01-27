import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/entities/main_page_entity.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_bloc.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_state.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/widget/view_news_page.dart';
import 'package:news_analysis_design/core/utils/date.dart';

import 'container_hot_news.dart';

class BuildHotNewsContainer extends StatefulWidget {
  const BuildHotNewsContainer({Key? key}) : super(key: key);

  @override
  State<BuildHotNewsContainer> createState() => _BuildHotNewsContainerState();
}

class _BuildHotNewsContainerState extends State<BuildHotNewsContainer> {
  MainPageEntity? mainPageEntity;
  G2j? _g2j;
  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<NewsBloc>(context).add(GetNewsList());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state is NewsError) {
          Text(state.message!);
        }
      },
      child: BlocBuilder<NewsBloc, NewsState>(
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

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Padding containerBuilder(BuildContext context, List<MainPageEntity> mainPageEntity) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 20),
      child: SizedBox(
        height: 326,
        child: ListView.builder(
          reverse: true,
          itemCount: mainPageEntity.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //G2j(index, newsModel.items![index].pubDate.toString());
            // var date =
            //     G2j(index, newsModel[index].publishDate![index].toString())
            //         .g2jDate();
            // var time =
            //     G2j(index, newsModel[index].lastUpdateDate![index].toString())
            //         .g2jTime();
            //var date = _g2j!.dateG(newsModel.items![index].pubDate.toString());
            //ConvertDate();

            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: HotNewsContainer(
                  author: mainPageEntity[index].title!.toString(),
                  title: mainPageEntity[index].title!,
                  describe: mainPageEntity[index].description!,
                  imageUrl: mainPageEntity[index].imageUrl.toString(),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewNews(
                      author: mainPageEntity[index].description!,
                      title: mainPageEntity[index].title!,
                      describe: mainPageEntity[index].url!,
                      imageUrl: mainPageEntity[index].imageUrl.toString(),
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
