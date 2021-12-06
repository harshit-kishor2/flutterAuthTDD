import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceModule {
  final SharedPreferences pref;
  static const String _prefUser = "@user_data";

  SharedPreferenceModule({required this.pref});

  void clear() => pref.clear();

  void saveUserData(String userDataInJson) =>
      pref.setString(_prefUser, userDataInJson);

  String getUserData() {
    String userDataInJson = pref.getString(_prefUser) ?? "";
    return userDataInJson;
  }
}
