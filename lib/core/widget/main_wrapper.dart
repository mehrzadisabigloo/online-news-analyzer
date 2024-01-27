import 'package:flutter/material.dart';

import 'home_page.dart';



class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MyAppState();
}

class _MyAppState extends State<MainWrapper> {
  var _bottonNavigationBar = 2;

  @override
  Widget build(BuildContext context) {
    List<Widget> getLayout() {
      return <Widget>[
        //HotNewsContainer(),
        Container(),
        Container(),
        HomePage(),
      ];
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: IndexedStack(
            index: _bottonNavigationBar,
            children: getLayout(),
          ),
          bottomNavigationBar: SizedBox(
            height: 89,
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: 1,
              onTap: (index) {
                setState(() {
                  _bottonNavigationBar = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset('assets/images/icon_search.png'),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset('assets/images/icon_setting.png'),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(
                    'assets/images/icon_home.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}