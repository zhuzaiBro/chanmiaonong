import 'dart:core';

import 'package:chanmiaonong/store/user/reducer.dart';

/// user 全局共享数据模型
class User {
  String name;
  String phone;
  User.initData()
      : name = '',
        phone = '';
}

class UserState {
  User user;
  UserState({required this.user});
}

UserState getUserInfo(UserState state, action) {
  return UserState(user: UserReducer(state.user, action));
}
