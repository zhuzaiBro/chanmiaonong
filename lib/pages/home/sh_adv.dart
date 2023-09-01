import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShAdv extends StatelessWidget {
  List<dynamic> advList;
  ShAdv({Key? key, required this.advList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 345.w,
        height: 160.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  width: 160.w,
                  height: 160.h,
                  child: Image.network(
                    advList[0]["image"],
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  width: 160.w,
                  height: 77.h,
                  child: Image.network(
                    advList[1]["image"],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 160.w,
                  height: 77.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    advList[2]["image"],
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}
