import 'package:flutter/material.dart';
import 'package:news_analysis_design/core/widget/main_wrapper.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  '!خوش اومدی ',
                  style: TextStyle(fontFamily: 'IS'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 64,
                  width: 342,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const TextField(
                    showCursor: false,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black45),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(top: 18, bottom: 18, right: 21),
                      enabled: true,
                      hintText: 'ایمیل',
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(fontFamily: 'IS', color: Colors.black26),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 64,
                  width: 342,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const TextField(
                    showCursor: false,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 2, color: Colors.black12),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.only(top: 18, bottom: 18, right: 21),
                      enabled: true,
                      hintText: 'رمز عبور',
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(fontFamily: 'IS', color: Colors.black26),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const MainWrapper()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    minimumSize: const Size(342, 64),
                    backgroundColor: const Color(0xff5474FF),
                  ),
                  child: const Text(
                    'وارد شدن',
                    style: TextStyle(fontFamily: 'IS', fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(minimumSize: const Size(342, 64)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google 1.png'),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text(
                          'با گوگل وارد شوید',
                          style: TextStyle(fontFamily: 'IS', color: Colors.black),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
