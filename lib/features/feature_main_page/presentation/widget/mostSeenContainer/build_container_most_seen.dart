import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/entities/main_page_entity.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_bloc.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_state.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/widget/mostSeenContainer/container_most_seen.dart';

import '../../../../../core/utils/date.dart';

class BuildMostSeenContainer extends StatelessWidget {
  const BuildMostSeenContainer({Key? key}) : super(key: key);

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
            return buildContainer(context, state.newsModel);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
  Widget buildContainer(BuildContext context, List<MainPageEntity> mainPageEntity) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mainPageEntity.length,
        itemBuilder: ((context, index) {
          var date =
              G2j(index, mainPageEntity[index].publishDate!.toString()).g2jDate();
          var time =
              G2j(index, mainPageEntity[index].lastUpdateDate.toString()).g2jTime();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            child: MostSeenContainer(
              author: mainPageEntity[index].title.toString(),
              title: mainPageEntity[index].agency.toString(),
              date: date,
              imageUrl: mainPageEntity[index].imageUrl.toString(),
            ),
          );
        }),
      ),
    );
  }
}
