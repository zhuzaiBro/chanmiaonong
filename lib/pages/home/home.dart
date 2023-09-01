import 'dart:convert';

import 'package:chanmiaonong/components/menu.dart';
import 'package:chanmiaonong/components/notice_line/notice_line.dart';
import 'package:chanmiaonong/pages/home/seckill_box.dart';
import 'package:chanmiaonong/pages/home/sh_adv.dart';
import 'package:chanmiaonong/pages/home/userBox.dart';
import 'package:chanmiaonong/pages/shop/home.dart';
import 'package:chanmiaonong/utils/customRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'banner.dart';
import '../../utils/request.dart';

const bgDecoration = BoxDecoration(
  image: DecorationImage(
      image: NetworkImage(
          "https://cdn.discosoul.com.cn/farm-13093970633ef528ed29d84b6983ba0fb99c8150a7.png"),
      fit: BoxFit.cover,
      alignment: Alignment.topCenter),
);

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageBody> {
  int _counter = 0;
  List<dynamic> homeData = [];
  List<Widget> homeComps = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    request.get("/mall/shopindex/getCanvas?terminal=3").then(
      (res) {
        setState(() {
          homeData = jsonDecode(res.data['json']);
          homeComps = homeArea(homeData).toList();
          // print(homeData);
        });
      },
    ).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    request.get("/mall/shopindex/getCanvas?terminal=3").then(
      (res) {
        setState(() {
          homeData = json.decode(res.data['json']);
          homeComps = homeArea(homeData);
        });
      },
    ).catchError((e) {
      debugPrint(e);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bgDecoration,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
              refreshIndicatorExtent: 20.h,
              refreshTriggerPullDistance: 20.h,
              onRefresh: () => HapticFeedback.mediumImpact(),
              builder: (context, refreshState, top, refreshTriggerPullDistance,
                  refreshIndicatorExtent) {
                return SizedBox(
                  height: 188.h,
                  width: 390.w,
                  child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: top >= 30.h ? 1.0 : 0.0,
                      // opacity: 1.0,
                      child: Center(
                          child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 44.h, left: 130.w),
                            width: 115.w,
                            height: 88.h,
                            child: Image.network(
                                "https://cdn.discosoul.com.cn/farm-130939706324650e02142240eeb648c0a5ce1dd1e2.gif"),
                          ),
                          // Text(
                          //   RefreshIndicatorMode.done == refreshState
                          //       ? '松开刷新'
                          //       : '下拉刷新',
                          //   style: const TextStyle(
                          //       fontSize: 14.0, color: Colors.white),
                          // ),
                        ],
                      ))),
                );
              }),
          SliverToBoxAdapter(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 44.h, left: 15.w),
                alignment: Alignment.topLeft,
                child: Text(
                  "馋喵农",
                  style: TextStyle(
                    color: Color.fromRGBO(133, 133, 123, 1),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: homeComps,
              ),
              Container(
                padding: const EdgeInsets.all(12),
              )
            ],
          )),
        ],
      ),
    );
  }
}

List<Widget> homeArea(List<dynamic> homeData) {
  return homeData.map((e) {
    switch (e['type']) {
      case 'menu':
        return UserBox(menuData: e['componentContent']['menus']);
      case 'banner':
        return HomeBanner(
          bannerData: e['componentContent']['bannerData'],
        );
      case 'noticeBar':
        // print(e);
        return NoticeLine(texts: e['componentContent']['roll']);
      case 'hotCommodity':
        return SeckillBox();

      case 'adv':
        return ShAdv(
          advList: e['componentContent']['detail']['list'],
        );
      default:
        return Container(
            // padding: const EdgeInsets.all(10),
            // child: Text(e['title'] + e['type']),
            );
    }
  }).toList();

  ;
}
