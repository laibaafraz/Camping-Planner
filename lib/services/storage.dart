import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

typedef Rows = List<Map<String, dynamic>>;

class Storage {
  static Future<Rows> load(String key, Rows fallback) async {
    final p = await SharedPreferences.getInstance();
    final s = p.getString(key);
    if (s == null) return fallback;
    return (jsonDecode(s) as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  static Future<void> save(String key, Rows rows) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(key, jsonEncode(rows));
  }
}
