import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:testpyco/model/people.dart';

class TinderService {
  Future<DataTinder> loadDataFromDB() async {
    List<DataTinder> listData = List();
    final value = await rootBundle.loadString('data/data.json');
    if (value != null) {
      final dataJson = json.decode(value);
      for (final country in dataJson) {
        listData.add(DataTinder.fromJson(country));
      }
      return listData[0];
    }
    return null;
  }
}
