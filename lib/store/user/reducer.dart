import 'package:chanmiaonong/store/user/user.dart';
import 'package:redux/redux.dart';

/// combineReducers的作用是把action和函数绑定起来，
/// 免去了写例如if (action is IncreaseAction)之类的判断语句。
/// 对应的action执行对应的函数。
// ignore: non_constant_identifier_names
final UserReducer = combineReducers<User>([
  TypedReducer<User, AddUserAction>(_add),
  TypedReducer<User, UpdateUserAction>(_update),
]);

/// 定义了一个要与AddUserAction绑定一起函数
/// 该函数的作用主要是修改数据，就是之前的if和else里各自要处理的逻辑
User _add(User user, AddUserAction addAction) {
  addAction.user.name = "小明";
  user = addAction.user;
  return user;
}

/// 定义了一个 action AddUserAction
class AddUserAction {
  User user;
  AddUserAction(this.user);
}

User _update(User user, UpdateUserAction action) {
  user = action.user;
  return user;
}

class UpdateUserAction {
  User user;
  UpdateUserAction(this.user);
}
