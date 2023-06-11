import '../utils/api_base_helper.dart';
import '../utils/local_data.dart';

class BooksRepository {
  static Future<dynamic> get({required String query}) async {
    bool haveConnection = await ApiBaseHelper.checkConnection();
    if (haveConnection) {
      dynamic data = await ApiBaseHelper.get(endpoint: query);
      // LocalData().saveData(key: '', value: data);
      return data;
    } else {
      dynamic data = await LocalData().loadData(key: '');
      return data;
    }
  }
}
