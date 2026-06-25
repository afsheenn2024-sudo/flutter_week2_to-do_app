import 'package:shared_preferences/shared_preferences.dart';

class StorageService {

  //SAVE COUNTER
  static Future<void> saveCounter(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("counter", value);
  }

  //  GET COUNTER
  static Future<int> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("counter") ?? 0;
  }

  //  SAVE TASKS
  static Future<void> saveTasks(List<String> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("tasks", tasks);
  }

  //GET TASKS
  static Future<List<String>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("tasks") ?? [];
  }
}