import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String?> getData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<void> deleteData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
