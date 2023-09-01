import 'package:chanmiaonong/components/customAppbar.dart';
import 'package:chanmiaonong/pages/cloudFeed/cloudFeed.dart';
import 'package:chanmiaonong/pages/user/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:chanmiaonong/pages/home/home.dart';
import 'package:chanmiaonong/pages/shop/home.dart';

import 'package:redux/redux.dart';
import 'bottom_navigation_bar.dart';
import 'bottom_navigation_bar_item.dart' as MyBarItem;
import 'player_tab_item.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _HomeTabBarState extends State<HomeTabBar> with TickerProviderStateMixin {
  late List<Widget> pages;

  final defaultItemColor = const Color.fromARGB(255, 255, 255, 255);

  late List<AnimationController> animationControllers = [];

  late List<Animation<double>> animations = [];

  final itemNames = [
    _Item('首页', 'assets/images/tab-home-hot.png', 'assets/images/tab-home.png'),
    _Item(
        '商城', 'assets/images/tab-class-hot.png', 'assets/images/tab-class.png'),
    _Item('云舍', 'assets/images/tab-yun-hot.png', 'assets/images/tab-yun.png'),
    _Item(
        '购物车', 'assets/images/tab-cart-hot.png', 'assets/images/tab-cart.png'),
    _Item('我的', 'assets/images/tab-user-hot.png', 'assets/images/tab-user.png')
  ];

  late List<MyBarItem.BottomNavigationBarItem> itemList;

  double progress = 0;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    /// barItem对应的页面
    pages = [
      const HomePageBody(),
      ShopHomeBody(),
      CloudFeed(),
      ShopHomeBody(),
      UserBody()
    ];

    animationControllers = [];
    itemList = [];
    for (var i = 0; i < itemNames.length; i++) {
      /// 为每个barItem创建单独的动画控制器
      AnimationController controller = _getAnimationController();
      animationControllers.add(controller);

      /// 为每个barItem创建的动画
      Animation<double> animate = _getAnimation(controller);
      animations.add(animate);

      itemList.add(_getBarItem(i, itemNames[i]));
    }
  }

  int _selectIndex = 0;

  final PlayerTabItem _playerItemLocation =
      PlayerTabItem(FloatingActionButtonLocation.centerDocked, 0, 24);

  /// 获取动画控制器
  AnimationController _getAnimationController() {
    AnimationController animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    return animationController;
  }

  /// 获取BarItem
  MyBarItem.BottomNavigationBarItem _getBarItem(int index, _Item item) {
    Animation<double> animation = animations[index];
    MyBarItem.BottomNavigationBarItem barItem =
        MyBarItem.BottomNavigationBarItem(
            icon: Image.asset(
              item.normalIcon,
              width: 30.0,
              height: 30.0,
            ),
            label: item.name,
            activeIcon: Image.asset(
              item.activeIcon,
              width: 30.0,
              height: 30.0,
            ));
    barItem.index = index;
    barItem.animation = animation;
    return barItem;
  }

  /// 多个缩放点的缩放动画
  Animation<double> _getAnimation(AnimationController controller) {
    List values = [1.0, 1.16, 0.9, 1.15, 0.95, 1.02, 1.0];
    double preValue = 1.0;
    List<TweenSequenceItem<double>> tweenItems = [];
    for (int i = 0; i < values.length; i++) {
      if (i != 0) {
        tweenItems.add(TweenSequenceItem<double>(
          tween: Tween(begin: preValue, end: values[i]),
          weight: 1,
        ));
      }
      preValue = values[i];
    }
    return TweenSequence<double>(tweenItems).animate(controller);
  }

  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(HomeTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: bars[_selectIndex],
      body: Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
          _getPagesWidget(4),
        ],
      ),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      bottomNavigationBar: MyBottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
            // if (index > 1) {
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent, //这里替换你选择的颜色
              ),
            );
            // } else {
            //   SystemChrome.setSystemUIOverlayStyle(
            //     SystemUiOverlayStyle.light.copyWith(
            //       statusBarColor: Colors.transparent, //这里替换你选择的颜色
            //     ),
            //   );
            // }
          });

          AnimationController animationController = animationControllers[index];
          animationController.reset();
          animationController.forward();
        },
        //图标大小
        iconSize: 24,

        currentIndex: _selectIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        fixedColor: const Color(0xFF000000),
        type: MyBottomNavigationBarType.fixed,
      ),
      //放在中间
    );
  }
}
