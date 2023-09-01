import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:chanmiaonong/store/user/reducer.dart';
import 'package:chanmiaonong/store/user/user.dart';
import 'package:chanmiaonong/store/user/action.dart';

class AppState {
  UserState userState;

  AppState({required this.userState});
}

Store<AppState> store = Store(
  (state, action) {
    return AppState(userState: action.userState);
  },
  initialState: AppState(userState: UserState(user: User.initData())),
);
