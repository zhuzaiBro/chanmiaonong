import 'dart:convert';

import 'package:chanmiaonong/components/layout/tab.dart';
import 'package:chanmiaonong/pages/home/home.dart';
import 'package:chanmiaonong/utils/request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_redux/flutter_redux.dart';
import 'package:chanmiaonong/store/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: ScreenUtilInit(
          designSize: const Size(375, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'First Method',
              onGenerateRoute: (settings) {
                final List<String> whiteList = [];
                if (whiteList.contains(settings.name)) {
                  debugPrint("触发路由守卫");
                }
              },
              // You can use the library anywhere in the app even in theme
              theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme:
                    Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              ),
              home: const HomeTabBar(),
            );
          },
        ));
  }
}
