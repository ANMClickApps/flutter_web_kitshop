import 'package:flutter/material.dart';

class AppDataModel with ChangeNotifier {
  String _id = '0';
  String get getCurrentId => _id;

  void updateSignUpId(String idResponse) {
    _id = idResponse;

    notifyListeners();
  }
}
