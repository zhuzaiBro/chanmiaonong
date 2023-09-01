// ignore: file_names
import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  //构造方法
  CustomRoute(this.widget)
      : super(
            transitionDuration: const Duration(milliseconds: 300), //过渡时间
            pageBuilder: (
              //构造器
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.linear)),
                transformHitTests: true,
                child: child,
              );
            });
}
