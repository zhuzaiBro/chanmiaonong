import 'package:flutter/material.dart';

class CloudFeed extends StatefulWidget {
  CloudFeed({Key? key}) : super(key: key);

  @override
  State<CloudFeed> createState() => _CloudFeedState();
}

class _CloudFeedState extends State<CloudFeed> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("云养殖页面"));
  }
}
