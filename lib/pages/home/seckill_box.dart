import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeckillBox extends StatefulWidget {
  SeckillBox({Key? key}) : super(key: key);

  @override
  State<SeckillBox> createState() => _SeckillBoxState();
}

class _SeckillBoxState extends State<SeckillBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      child: Stack(children: [
        Container(
          height: 105.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(194, 214, 0, 0.6),
              Color.fromRGBO(121, 185, 44, 1)
            ]),
          ),
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 6.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "限时秒杀 ",
                  style: TextStyle(
                    color: const Color.fromRGBO(118, 185, 44, 1),
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 20.h,
                  width: 80.w,
                  margin: EdgeInsets.only(left: 8.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.h)),
                  ),
                  child: Text(
                    "21 : 18 : 17",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color.fromRGBO(118, 185, 44, 1)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.w),
                  height: 14.h,
                  width: 98.w,
                  child: Image.network(
                    "https://cdn.discosoul.com.cn/farm-130939706327de5a9ffda340a5a3ab31eb8912172f.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Container(
                  height: 18.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(239, 193, 32, 1),
                      Color.fromRGBO(238, 146, 0, 1)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.all(Radius.circular(9.h)),
                  ),
                  child: Text(
                    "马上去抢",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(12.w, 38.h, 12.w, 0),
          height: 130.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.w))),
        )
      ]),
    );
  }
}
