import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getit = GetIt.instance;

Future<void> setup_locator() async {
  final prefs = await SharedPreferences.getInstance();
  getit.registerSingleton(prefs);
}