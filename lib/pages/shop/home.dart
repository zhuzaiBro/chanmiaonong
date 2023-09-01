import 'package:chanmiaonong/components/menu.dart';
import 'package:chanmiaonong/utils/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopHomeBody extends StatefulWidget {
  ShopHomeBody({Key? key}) : super(key: key);

  @override
  State<ShopHomeBody> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHomeBody> {
  int current = 0;

  List<dynamic> menus = [];
  List<dynamic> categories = [];
  List<dynamic> goodList = [];

  GlobalKey _fixedKey = new GlobalKey();

  @override
  void initState() {
    request.get("/mall/category").then((value) {
      List<dynamic> arr = [];
      for (var element in value.data['data']) {
        for (var item in element['children']) {
          arr.add(item);
        }
      }
      setState(() {
        categories = arr;
      });
    });

    request.get("/mall/shopindex/index").then((value) {
      setState(() {
        menus = value.data['data']['menus'];
      });
      // print(menus);
    });

    request.get("/mall/products").then((value) {
      setState(() {
        goodList = value.data['data'];
      });
      // print();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: 0, right: 0, top: 0, bottom: 0, child: buildSwper()),
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              width: 375.w,
              key: _fixedKey,
              padding: EdgeInsets.fromLTRB(15.w, 44.h, 15.w, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18.w),
                    bottomRight: Radius.circular(18.w),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(112, 112, 112, 1),
                      offset: Offset.zero,
                      blurRadius: 1.w,
                      spreadRadius: 1.w,
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "商城",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 6.h, 0, 6.h),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    height: 32.h,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(244, 244, 244, 1),
                        borderRadius: BorderRadius.all(Radius.circular(16.h))),
                    child: Row(children: [
                      const Icon(CupertinoIcons.search),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                  color: const Color.fromRGBO(224, 224, 224, 1),
                                  width: 1.w),
                            ),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          child: const Text(
                            '搜索商品',
                            style: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 1)),
                          ),
                        ),
                      ),
                      const Text(
                        '搜索',
                        style:
                            TextStyle(color: Color.fromRGBO(114, 187, 43, 1)),
                      ),
                    ]),
                  ),
                  Menus(menuData: menus),
                  buildCategories()
                ],
              ),
            )),
      ],
    );
  }

  buildSwper() {
    return PageView.builder(
      itemCount: categories.length,
      onPageChanged: (index) {
        setState(() {
          current = index;
        });
        request.get("/mall/products").then((value) {
          setState(() {
            goodList = value.data['data'];
          });
          // print();
        });
      },
      itemBuilder: ((context, index) {
        RenderObject? renderObject =
            _fixedKey.currentContext?.findRenderObject();
        return Container(
          margin: EdgeInsets.only(top: renderObject!.semanticBounds.height),
          child: CustomScrollView(
            slivers: [
              CupertinoSliverRefreshControl(
                  refreshIndicatorExtent: 20.h,
                  refreshTriggerPullDistance: 20.h,
                  onRefresh: () => HapticFeedback.mediumImpact(),
                  builder: (context, refreshState, top,
                      refreshTriggerPullDistance, refreshIndicatorExtent) {
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
                                margin: EdgeInsets.only(top: 3.h, left: 130.w),
                                width: 115.w,
                                height: 88.h,
                                child: Image.network(
                                    "https://cdn.discosoul.com.cn/farm-130939706324650e02142240eeb648c0a5ce1dd1e2.gif"),
                              ),
                            ],
                          ))),
                    );
                  }),
              SliverList(delegate: SliverChildListDelegate(buildGoods()))
            ],
          ),
        );
      }),
    );
  }

  buildCategories() {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      height: 28.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (ctx, index) {
            return Container(
                margin: EdgeInsets.only(right: 12.w),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: current == index
                          ? BorderSide(
                              color: const Color.fromRGBO(114, 187, 43, 1),
                              width: 2.h)
                          : BorderSide.none),
                ),
                // height: 28.h,

                child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                        color: index == current
                            ? const Color.fromRGBO(32, 32, 32, 1)
                            : const Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: current == index
                            ? FontWeight.w600
                            : FontWeight.normal),
                    duration: const Duration(milliseconds: 160),
                    child: Text(
                      categories[index]['cateName'],
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    )));
          }),
    );
  }

  buildGoods() {
    return List.generate(
      goodList.length,
      (index) => Container(
          width: 160.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromRGBO(199, 199, 199, 0.5),
                  offset: Offset.zero,
                  blurRadius: 1.w),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                  width: 160.w,
                  height: 173.h,
                  child: Image.network(goodList[index]['image'])),
            ],
          )),
    );
  }
}
