import 'package:flutter/material.dart';
import 'package:news_analysis_design/features/feature_favorite/presentation/screen/favorite_tabbar.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/screen/home_tabbar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int isTouched = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(
      () {
        setState(
          () {
            isTouched = _tabController!.index;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: getAppBar(),
      body: getTabView(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 75,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Image.asset('assets/images/icon_menu.png'),
        )
      ],
      bottom: TabBar(
        controller: _tabController,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
        indicatorColor: const Color(0xff5474FF),
        tabs: [
          Tab(
            child: Text(
              'مورد علاقه',
              style: isTouched == 0
                  ? const TextStyle(
                      fontFamily: 'IS',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                  : const TextStyle(
                      fontSize: 16,
                      fontFamily: 'IS',
                      color: Color.fromARGB(255, 110, 110, 110),
                    ),
            ),
          ),
          Tab(
            child: Text(
              'صفحه اصلی',
              style: isTouched == 1
                  ? const TextStyle(
                      fontFamily: 'IS',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                  : const TextStyle(
                      fontSize: 16,
                      fontFamily: 'IS',
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 110, 110, 110),
                    ),
            ),
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: const Color(0xffFAFAFA),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Container(
          //margin: EdgeInsets.only(left: 24),
          child: Image.asset(
            'assets/images/icon_profile.png',
          ),
        ),
      ),
      title: const Text(
        'خبر داغ',
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'IS',
            color: Color(0xff5474FF),
            fontWeight: FontWeight.w700),
      ),
    );
  }

  TabBarView getTabView() {
    return TabBarView(
      controller: _tabController,
      children: const <Widget>[
        FavoriteTabBarView(),
        HomeTabBarView(),
      ],
    );
  }
}
