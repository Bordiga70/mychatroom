import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();

  factory PreferencesService() => _instance;

  PreferencesService._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> clearUserPreferences() async {
    setCurrentSessionUsr('');
    setCurrentSessionEmail('');
    setCurrentSessionPwd('');
    setCurrentSessionId(0);
    setDark(false);
    setStyle('default');
  }

  bool get isDark => _prefs.getBool('isDark') ?? false;

  String get getTextStyle => _prefs.getString('textStyle') ?? 'default';

  String get getCurrentSessionUsr => _prefs.getString('currentUsr') ?? '';

  String get getCurrentSessionEmail => _prefs.getString('currentEmail') ?? '';

  String get getCurrentSessionPwd => _prefs.getString('currentPwd') ?? '';

  int get getCurrentSessionId => _prefs.getInt('currentId') ?? 0;

  Future<void> setDark(bool value) => _prefs.setBool('isDark', value);

  Future<void> setStyle(String value) => _prefs.setString('textStyle', value);

  Future<void> setCurrentSessionUsr(String value) =>
      _prefs.setString('currentUsr', value);

  Future<void> setCurrentSessionEmail(String value) =>
      _prefs.setString('currentEmail', value);

  Future<void> setCurrentSessionPwd(String value) =>
      _prefs.setString('currentPwd', value);

  Future<void> setCurrentSessionId(int id) => _prefs.setInt('currentId', id);
}
