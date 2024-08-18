import 'package:shared_preferences/shared_preferences.dart';

class CashHelperSharedPreferences {
  static SharedPreferences? _sharedPreferences;

  /// Initializes the SharedPreferences instance.
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Saves data to SharedPreferences.
  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (_sharedPreferences == null) {
      throw Exception('SharedPreferences not initialized');
    }

    final saveFunctions = {
      String: (String key, String value) => _sharedPreferences!.setString(key, value),
      int: (String key, int value) => _sharedPreferences!.setInt(key, value),
      bool: (String key, bool value) => _sharedPreferences!.setBool(key, value),
      double: (String key, double value) => _sharedPreferences!.setDouble(key, value),
      List<String>: (String key, List<String> value) => _sharedPreferences!.setStringList(key, value),
    };

    // Get the save function for the value type.
    final saveFunction = saveFunctions[value.runtimeType];
    if (saveFunction != null) {
      return await saveFunction(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  /// Retrieves data from SharedPreferences.
  dynamic getData({
    required String key,
  }) {
    if (_sharedPreferences == null) {
      throw Exception('SharedPreferences not initialized');
    }
    return _sharedPreferences?.get(key);
  }

  /// Removes data from SharedPreferences.
  Future<bool> removeData({
    required String key,
  }) async {
    if (_sharedPreferences == null) {
      throw Exception('SharedPreferences not initialized');
    }
    return await _sharedPreferences!.remove(key);
  }

  /// Clears all data from SharedPreferences.
  Future<bool> clearData() async {
    if (_sharedPreferences == null) {
      throw Exception('SharedPreferences not initialized');
    }
    return await _sharedPreferences!.clear();
  }
}