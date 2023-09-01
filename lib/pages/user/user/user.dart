import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserBody extends StatefulWidget {
  UserBody({Key? key}) : super(key: key);

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.discosoul.com.cn/farm-1309397063f24b5c17cdfb4d04b3127b98c05489aa.png"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                  repeat: ImageRepeat.noRepeat),
            ),
            width: 390.w,
            child: Column(
              children: [
                // 用户昵称，积分信息啥的
                Container(
                  margin: EdgeInsets.fromLTRB(30.w, 88.h, 30.w, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.w,
                        margin: EdgeInsets.fromLTRB(0, 0, 12.w, 0),
                        child: Image.network(
                          "https://cdn.discosoul.com.cn/farm-13093970637a408e53681d49f49bab93268427f592.png",
                        ),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              "小喵农",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: const Color.fromRGBO(23, 94, 0, 1)),
                            ),
                            Container(
                              height: 20.h,
                              margin: EdgeInsets.fromLTRB(8.w, 0, 0, 0),
                              padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Color.fromRGBO(255, 226, 77, 1)),
                              child: Text(
                                "招财喵",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            )
                          ]),
                          Text(
                            "积分：100",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color.fromRGBO(23, 94, 0, 1)),
                          )
                        ],
                      )),
                      SizedBox(
                        width: 25.w,
                        height: 25.w,
                        child: Image.network(
                            "https://cdn.discosoul.com.cn/farm-13093970633532e20ad51e443daa28814506736df8.png"),
                      )
                    ],
                  ),
                ),
                // 用户财产 积分，领养啥的
                Container(
                  margin: EdgeInsets.fromLTRB(0, 26.h, 0, 0),
                  child: Row(children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "300",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        const Text(
                          "积分",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "300",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        const Text("积分",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "300",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        const Text("积分",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)))
                      ],
                    ))
                  ]),
                ),
                // 会员卡区域

                GestureDetector(
                    onTap: () {
                      print("会员页面");
                    },
                    child: Container(
                      width: 375.w,
                      height: 88.h,
                      padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.discosoul.com.cn/farm-13093970636dd1999446c24b109c97737056b52815.jpg"),
                              fit: BoxFit.fitWidth)),
                      child: Container(
                        // color: Color.fromRGBO(69, 69, 69, 1),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 12.h),
                        // margin: EdgeInsets.fromLTRB(0, -8.h, right, bottom),
                        child: Row(
                          children: [
                            const Expanded(flex: 1, child: Text("")), // 站位
                            Expanded(
                                flex: 1,
                                child: Row(children: [
                                  Expanded(
                                      child: Text(
                                    "每月可省168元",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1)),
                                  )),
                                  Container(
                                    width: 68.w,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(255, 224, 82, 1),
                                        Color.fromRGBO(221, 179, 0, 1)
                                      ]),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: Text(
                                      "立即开通 >",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  )
                                ])),
                          ],
                        ),
                      ),
                    )),
              ],
            )),
        SizedBox(
          width: 375.w,
          child: Column(
            children: [
              Container(
                  width: 375.w,
                  margin: EdgeInsets.fromLTRB(40.w, 0, 0, 0),
                  child: Text(
                    "我的订单",
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromRGBO(0, 0, 0, 1)),
                  )),
              Container(
                width: 375.w,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
                padding: EdgeInsets.fromLTRB(0, 8.h, 0, 8.h),
                child: Row(children: [
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-1309397063df7469ab062f4d7397c7004e5ad452ac.png",
                      "待付款"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-13093970638bb7007c5bdf4dff90d5ea078af87bce.png",
                      "待发货"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-1309397063a132ec5f5c6b4196a68033ede023e2e1.png",
                      "待收货"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-13093970635278a90cd4244581b917187ee3cc6cf3.png",
                      "售后服务")
                ]),
              ),
              Container(
                  width: 375.w,
                  margin: EdgeInsets.fromLTRB(40.w, 10.h, 0, 0),
                  child: Text(
                    "我的服务",
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromRGBO(0, 0, 0, 1)),
                  )),
              Container(
                width: 375.w,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
                padding: EdgeInsets.fromLTRB(0, 8.h, 0, 8.h),
                child: Row(children: [
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-1309397063de3fddd43ac0471995d267c8ea1522c6.png",
                      "观看直播"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-13093970638a61f9cf566340619f06dd17d49b66c3.png",
                      "我的优惠"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-1309397063e5a547bcca8b4da181955e9685132185.png",
                      "生鲜自提"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-130939706341b95cb1df4a4bcfbaaa124d966d5e3d.png",
                      "我的地址")
                ]),
              ),
              Container(
                  width: 375.w,
                  margin: EdgeInsets.fromLTRB(40.w, 10.h, 0, 0),
                  child: Text(
                    "其他",
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color.fromRGBO(0, 0, 0, 1)),
                  )),
              Container(
                width: 375.w,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
                padding: EdgeInsets.fromLTRB(0, 8.h, 0, 8.h),
                child: Row(children: [
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-1309397063df7469ab062f4d7397c7004e5ad452ac.png",
                      "待付款"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-13093970638bb7007c5bdf4dff90d5ea078af87bce.png",
                      "待发货"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-1309397063a132ec5f5c6b4196a68033ede023e2e1.png",
                      "待收货"),
                  IconItem(
                      "https://cdn.discosoul.com.cn/farm-13093970635278a90cd4244581b917187ee3cc6cf3.png",
                      "售后服务")
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget IconItem(String url, String title) {
  return Expanded(
    flex: 1,
    child: GestureDetector(
        onTap: () {
          print("object");
        },
        child: Column(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 8.h),
              child: Image.network(url),
            ),
            Text(
              title,
              style: TextStyle(
                  color: const Color.fromRGBO(0, 0, 0, 1), fontSize: 14.sp),
            )
          ],
        )),
  );
}
