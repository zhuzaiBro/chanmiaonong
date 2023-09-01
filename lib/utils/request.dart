import 'package:dio/dio.dart';

Dio request = Dio(BaseOptions(
    baseUrl: "https://www.discosoul.com.cn/shop",
    connectTimeout: 5000,
    sendTimeout: 3000));
