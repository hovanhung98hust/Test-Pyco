import 'package:testpyco/common/strings.dart';
import 'package:testpyco/model/user.dart';
import 'package:testpyco/service/data_helper.dart';

class HomeViewModel {
  String tabSelected = TYPE_PERSONAL;
  User currentUser;
  double currentAlign = 0;
  bool online = true;
  final DataBaseHelper dataBaseHelper;

  HomeViewModel(this.dataBaseHelper);

  void setTabSelected(String tab) {
    tabSelected = tab;
  }

  void setCurrentData(User user) {
    currentUser = user;
  }

  void saveUserFavorite(double beginAlign) async {
    if (currentAlign == 0 || currentAlign != beginAlign) {
      currentAlign = beginAlign;
      dataBaseHelper.insertUser(currentUser);
    }
  }
}
