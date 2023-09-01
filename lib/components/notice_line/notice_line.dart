import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeLine extends StatefulWidget {
  List<dynamic> texts;
  NoticeLine({Key? key, required this.texts}) : super(key: key);

  @override
  State<NoticeLine> createState() => _NoticeLineState();
}

class _NoticeLineState extends State<NoticeLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat(period: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(118, 185, 44, 1),
                offset: Offset.zero,
                blurRadius: 1.w)
          ]),
      height: 28.h,
      width: 345.w,
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: Image.network(
              "https://cdn.discosoul.com.cn/farm-1309397063f0fb5c1a9613400a82ccbdd0af6b4944.png",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.none,
              child: LayoutBuilder(
                builder: ((context, constraints) {
                  const childWidth = 150.0;
                  const startOffset = Offset(0, 0);

                  final endOffset = Offset(0.2.w, 0);

                  final offsetAnimation =
                      Tween<Offset>(begin: startOffset, end: endOffset)
                          .animate(_controller);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: Text(widget.texts[0]['info'],
                        maxLines: 1, style: TextStyle()),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
