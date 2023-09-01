import 'package:chanmiaonong/components/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserBox extends StatefulWidget {
  List<dynamic> menuData;
  UserBox({Key? key, required this.menuData}) : super(key: key);

  @override
  State<UserBox> createState() => _UserBoxState();
}

class _UserBoxState extends State<UserBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.w, top: 5.h, bottom: 5.h),
          alignment: Alignment.topLeft,
          child: Text(
            "Hi~小喵农",
            style: TextStyle(
              color: Color.fromRGBO(240, 255, 179, 1),
              fontSize: 16.sp,
            ),
          ),
        ),
        Container(
            width: 345.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.w)),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.w),
                      topRight: Radius.circular(8.w),
                    ),
                    color: const Color.fromRGBO(249, 250, 240, 1),
                  ),
                  child: Container(
                    height: 65.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.w),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x61b86333),
                              blurRadius: 1.w,
                              offset: Offset.zero)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(8.w)),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    child: Row(children: [
                      CircleAvatar(
                        foregroundImage: NetworkImage(
                            "https://cdn.discosoul.com.cn/farm-13093970637a408e53681d49f49bab93268427f592.png"),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80.w,
                                    child: Text(
                                      "点击登录",
                                      style: TextStyle(
                                        color: Color.fromRGBO(34, 34, 34, 1),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.w),
                                    height: 16.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6.w),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(247, 234, 96, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.h))),
                                    child: Text(
                                      "小土喵",
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            194, 215, 74, 1),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "积分：800",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  height: 168.h,
                  width: 345.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://cdn.discosoul.com.cn/farm-13093970639c76763167af4e72ab78016f379c3f6d.png",
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Column(children: [
                    Menus(menuData: widget.menuData),
                    Container(
                      padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 1),
                      child: Row(
                        children: [
                          Text("我的领养"),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Text("0只"),
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Stack(
                              children: [
                                Positioned(
                                    child: Container(
                                  width: 58.w,
                                  height: 24.h,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.h)),
                                    color:
                                        const Color.fromRGBO(234, 227, 172, 1),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(12.w, 10.w, 12.w, 0),
                      height: 33.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16.w)),
                        border: Border(
                          bottom: BorderSide(
                              color: const Color.fromRGBO(190, 216, 0, 1),
                              width: 1.w),
                          left: BorderSide(
                              color: const Color.fromRGBO(190, 216, 0, 1),
                              width: 1.w),
                          top: BorderSide(
                              color: const Color.fromRGBO(190, 216, 0, 1),
                              width: 1.w),
                          right: BorderSide(
                              color: const Color.fromRGBO(190, 216, 0, 1),
                              width: 1.w),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 14.w,
                              height: 14.w,
                              margin: EdgeInsets.only(right: 7.w),
                              child: Image.network(
                                  "https://cdn.discosoul.com.cn/farm-13093970634c70c7d4b48d4f26841069fcecde8db1.png"),
                            ),
                            Text(
                              "添加领养",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color.fromRGBO(190, 216, 0, 1),
                              ),
                            )
                          ]),
                    )
                  ]),
                )
              ],
            ))
      ],
    );
  }
}
