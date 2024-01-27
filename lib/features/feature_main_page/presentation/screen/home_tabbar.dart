import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/usecase/main_page_usecase.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_bloc.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_event.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/widget/hotNewsContainer/build_container_hot_news.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/widget/mostSeenContainer/build_container_most_seen.dart';
import 'package:news_analysis_design/locator.dart';


class HomeTabBarView extends StatefulWidget {
  const HomeTabBarView({Key? key}) : super(key: key);

  @override
  State<HomeTabBarView> createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<HomeTabBarView>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(GetNewsList());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return sliverHomeTabBar();
  }

  CustomScrollView sliverHomeTabBar() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, right: 28, left: 28),
            child: Row(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/arrow_more.png'),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      'مشاهده بیشتر',
                      style: TextStyle(
                        fontFamily: 'IS',
                        fontSize: 10,
                        color: Color(0xff5474FF),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset('assets/images/fire.png'),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'اخبار داغ',
                      style: TextStyle(
                          fontFamily: 'IS',
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: BuildHotNewsContainer(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 14, right: 28, left: 28),
            child: Row(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/arrow_more.png'),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      'مشاهده بیشتر',
                      style: TextStyle(
                        fontFamily: 'IS',
                        fontSize: 10,
                        color: Color(0xff5474FF),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'اخبار پربازدید',
                  style: TextStyle(
                      fontFamily: 'IS',
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: BuildMostSeenContainer(),
        )
      ],
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
