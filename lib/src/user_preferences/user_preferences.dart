import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static String _name = "";
  static int _tipoRol = 0;
  static String _photo = "";
  static String _correo = "";

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get correo {
    return _prefs.getString("correo") ?? _correo;
  }

  static set correo(String correo) {
    _correo = correo;
    _prefs.setString("photo", photo);
  }

  static String get photo {
    return _prefs.getString("photo") ?? _photo;
  }

  static set photo(String photo) {
    _photo = photo;
    _prefs.setString("photo", photo);
  }

  static String get name => _prefs.getString("nombre") ?? _name;

  static set name(String name) {
    _prefs.setString("nombre", name);
    _name = name;
  }

  static int get tipoRol => _prefs.getInt("tipoRol") ?? _tipoRol;

  static set tipoRol(int rol) {
    _prefs.setInt("tipoRol", rol);
    _tipoRol = rol;
  }
}
