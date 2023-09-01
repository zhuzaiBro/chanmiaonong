import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  double barHeight = 0.h;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(barHeight);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
