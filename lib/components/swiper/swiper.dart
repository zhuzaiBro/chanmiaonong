import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Swiper extends StatefulWidget {
  List<dynamic> imgs;
  Swiper({Key? key, required this.imgs}) : super(key: key);

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  int maxPage = 200000;
  int middlePage = 100000;
  int current = 0;
  late Timer timer;
  // late PageController pageController;

  @override
  void initState() {
    super.initState();
    setState(() {
      current = 0 + middlePage;
      // pageController = PageController(viewportFraction: 1.0);

      // timer = Timer.periodic(const Duration(milliseconds: 3000), (timer) {
      //   pageController.nextPage(
      //       duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: 0, right: 0, top: 0, bottom: 0, child: buildSwiper()),
        Positioned(left: 0, right: 0, top: 0, bottom: 0, child: buildIdicator())
      ],
    );
  }

  Widget buildIdicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
          widget.imgs.length,
          (index) => Container(
                width: 6.w,
                height: 6.w,
                margin: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 8.h),
                decoration: BoxDecoration(
                  color: index == current % widget.imgs.length
                      ? Colors.white
                      : Colors.grey[400],
                  borderRadius: BorderRadius.all(Radius.circular(3.w)),
                ),
              )),
    );
  }

  buildSwiper() {
    return PageView.builder(
      onPageChanged: (index) {
        setState(() {
          current = index;
        });
      },
      itemCount: maxPage,
      // controller: pageController,
      itemBuilder: (context, index) {
        double scaleVal = index == current || current == middlePage ? 1.0 : 0.9;
        return TweenAnimationBuilder(
            tween: Tween(begin: scaleVal, end: scaleVal),
            duration: const Duration(milliseconds: 300),
            builder: (context, double value, _) {
              return Transform.scale(
                scale: scaleVal,
                child: Image.network(
                  widget.imgs[index % widget.imgs.length]['pic'],
                  fit: BoxFit.fitWidth,
                ),
              );
            });
      },
    );
  }
}
