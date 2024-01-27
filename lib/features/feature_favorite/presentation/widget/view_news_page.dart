import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewNews extends StatelessWidget {
  ViewNews({
    Key? key,
    required this.title,
    required this.author,
    required this.describe,
    required this.imageUrl
  }) : super(key: key);
  String title;
  String author;
  String describe;
  String imageUrl;
  //String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrelled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: false,
              toolbarHeight: 20,
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          'assets/images/arrow-left.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 27,
                    ),
                    Image.asset('assets/images/frame.png'),
                    const SizedBox(
                      width: 313,
                    ),
                    Image.asset('assets/images/short-Menu.png'),
                    const SizedBox(
                      width: 26,
                    ),
                  ],
                )
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: Stack(
                  children: [
                    Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 180,
                      top: 4,
                      left: 180,
                      child: Container(
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(26, 7, 7, 7),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(imageUrl,fit: BoxFit.cover,),
              ),
            ),
          ];
        },
        body: getContainer(),
      ),
    );
  }

  Widget getContainer() {
    return SingleChildScrollView(
      child: Column(
        children: [
          topSub(),
          const SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 370,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'IS',
                    color: Colors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          tagContainer(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 350,
                  child: Text(
                    describe,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'IS',
                      color: Colors.black,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Container(
                    height: 100,
                    width: 2,
                    decoration: const BoxDecoration(
                      color: Color(0xffFF033E),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row topSub() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Text(
        //   '$date',
        //   style: TextStyle(
        //     fontSize: 13,
        //     fontFamily: 'IS',
        //     color: Colors.black,
        //   ),
        // ),
        Container(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          height: 26,
          decoration: const BoxDecoration(
            color: Color(0xffFF033E),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text(
                //   date,
                //   style: TextStyle(
                //     fontSize: 10,
                //     fontFamily: 'IS',
                //     color: Colors.white,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Image.asset('assets/images/logo_news_name1.png'),
                )
              ],
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              height: 20,
              child: Text(
                author,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'IS',
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
              padding: const EdgeInsets.only(top: 6),
              child: Image.asset('assets/images/flash-circle.png'),
            )
          ],
        )
      ],
    );
  }

  Padding tagContainer() {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 36,
            width: 77,
            decoration: const BoxDecoration(
              color: Color(0xffFFCDD8),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: const Center(
              child: Text(
                'ورزشی',
                style: TextStyle(
                    fontFamily: 'IS', fontSize: 15, color: Color(0xffFF033E)),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
              height: 36,
              width: 77,
              decoration: const BoxDecoration(
                color: Color(0xffFFCDD8),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: const Center(
                child: Text(
                  'لژیونر ها',
                  style: TextStyle(
                      fontFamily: 'IS', fontSize: 15, color: Color(0xffFF033E)),
                ),
              )),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 36,
            width: 77,
            decoration: const BoxDecoration(
              color: Color(0xffFFCDD8),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: const Center(
              child: Text(
                'فوتبال اروپا',
                style: TextStyle(
                  fontFamily: 'IS',
                  fontSize: 15,
                  color: Color(0xffFF033E),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
