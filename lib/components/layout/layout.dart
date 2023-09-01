import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout(
      {Key? key,
      required this.appBar,
      required this.body,
      this.isTab,
      this.bottomNavigationBar})
      : super(key: key);

  final PreferredSizeWidget appBar;
  final Widget body;
  final bool? isTab;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
