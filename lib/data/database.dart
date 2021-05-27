import 'package:digitours/data/model/auth_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  Box<bool> appSettingsBools;
  Box<AuthModel> authBox;
  Box accessTokenBox;

  init() async {
    await Hive.initFlutter();
    await _initaliseBoxes();
    _registerAdapters();
  }

  Future _initaliseBoxes() async {
    authBox = await Hive.openBox('authbox');
    appSettingsBools = await Hive.openBox('appsettingsbools');
    accessTokenBox = await Hive.openBox('accesstokenbox');
  }

  void _registerAdapters() {
    Hive.registerAdapter(AuthModelAdapter());
  }
}

DataBase db = DataBase();
