import 'dart:io';
import 'package:testpyco/model/people.dart';
import 'package:testpyco/model/user.dart';
import 'package:testpyco/service/data_helper.dart';
import 'package:testpyco/service/tinder_service.dart';

class SplashViewModel {
  final TinderService tinderService;
  final DataBaseHelper dataBaseHelper;
  List<User> listData = List();
  bool online;

  SplashViewModel(this.tinderService, this.dataBaseHelper);

  Future loadData() async {
    online = await checkInternet();
    if (online) {
      DataTinder data = await tinderService.loadDataFromDB();
      for (int i = 0; i < 5; i++) {
        String fullName =
            '${data.results[0].name.title}.${data.results[0].name.first}-${data.results[0].name.last} $i';
        String email = data.results[0].email;
        String address = data.results[0].location.street;
        String phone = data.results[0].phone;
        String urlMedium = data.results[0].picture.medium;
        String gender = data.results[0].gender;
        User user = User(
            name: fullName,
            email: email,
            phone: phone,
            address: address,
            gender: gender,
            urlMedium: urlMedium);
        listData.add(user);
      }
    } else {
      if (dataBaseHelper != null) {
        listData = await dataBaseHelper.getAllUser();
      }
    }
    await Future.delayed(Duration(seconds: 1));
  }

  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
