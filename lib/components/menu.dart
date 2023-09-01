import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Menus extends StatelessWidget {
  List<dynamic> menuData;
  Menus({super.key, required this.menuData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: MenuComp(menuData),
      ),
    );
  }
}

List<Widget> MenuComp(List<dynamic> menuData) {
  return menuData
      .map((e) => Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  margin: EdgeInsets.only(bottom: 4.h),
                  child: Image.network(e['pic']),
                ),
                Text(
                  e['name'],
                  style: TextStyle(fontSize: 12.sm),
                )
              ],
            ),
          ))
      .toList();
}
