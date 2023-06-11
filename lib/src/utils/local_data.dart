import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

class LocalData {
  LocalData();

  void saveData({dynamic key, dynamic value}) async {
    try {
      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();

      Hive.init(appDocumentDir.path);

      var box = await Hive.openBox('WEB_EXAMPLE');
      await box.put(key, value);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<dynamic> loadData({dynamic key}) async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    var box = await Hive.openBox('WEB_EXAMPLE');
    return box.get(key);
  }

  Future<bool> clearData() async {
    try {
      Hive.deleteBoxFromDisk('WEB_EXAMPLE');
      Hive.deleteFromDisk();
      return true;
    } catch (e) {
      return false;
    }
  }
}
