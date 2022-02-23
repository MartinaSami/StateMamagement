import 'dart:convert' show json;
import 'package:dio/dio.dart' as dio;
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:statemanagmenetstacked/app/app.locator.dart';
import '../data_models/user.dart';
import "http_service.dart";

class AuthService {
  String? _token;

  User? _user;
  final _sharedPreferences = locator<SharedPreferences>();
  final HttpService _httpService = locator<HttpService>();
  final navigationService = locator<NavigationService>();
  int _selectedAgeValue = 0;
  int _selectedHeightValue = 0;
  double _selectedWeightValue = 0;

  late dio.Dio _client;
  final Map<String, dynamic> _signupValues = {
    "name": null,
    "email": null,
    "phoneNumber": null,
    "nationality": null,
    "password": null,
    "confirm_password": null,
    "age": null,
    "height": null,
    "weight": null,
  };
  get signValues => _signupValues;

  AuthService() {
    this._client = _httpService.client;
  }
  String? get token {
    if (_token != null) {
      return this._token!;
    }
    return null;
  }

  bool get isAuth {
    return this.token != null;
  }

  int get userHeight => _selectedHeightValue;
  int get userAge => _selectedAgeValue;
  double get userWeight => _selectedWeightValue;
  String? get name => _user?.firstName;

  User? get user => _user;

  get registerValues => null;

  void addDioAuthHeader() {
    final defaultOptions = HttpService.baseOptions;
    defaultOptions.headers.addAll({"Authorization": "Bearer $_token"});

    _httpService.setupDio(defaultOptions);
  }

  Future<bool> login(Map<String, String> credentials) async {
    credentials["app_version"] = await this._getAppVersion();

    try {
      final res = await _client.post("login", data: json.encode(credentials));

      if (res.statusCode == 201) {
        _token = res.data["token"];

        _user = User.fromJson(res.data["user"]);

        await storeUserData(token: _token!, user: _user!);

        return true;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<bool> register(Map<String, dynamic> registerData) async {
    try {
      final res = await _client.post(
        "register",
        data: json.encode(registerData),
      );
      if (res.statusCode == 201) {
        _token = res.data["token"];
        _user = User.fromJson(res.data["user"]);

        await storeUserData(
          token: _token!,
          user: _user!,
        );
        return true;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<void> storeUserData({
    required String token,
    required User user,
  }) async {
    final storage = await SharedPreferences.getInstance();
    final userData = json.encode({
      "user": user,
      "token": token,
    });
    await storage.setString("userData", userData);
    this.addDioAuthHeader();
  }

  Future<bool> autoLogin() async {
    if (!_sharedPreferences.containsKey("userData")) {
      return false;
    }
    final Map<String, dynamic> userData =
        json.decode(_sharedPreferences.getString("userData")!);

    _token = userData["token"];
    _user = User.fromJson(userData["user"]);
    this.addDioAuthHeader();

    return true;
  }

  Future<void> logout() async {
    this._token = null;
    this._user = null;
    final storage = await SharedPreferences.getInstance();
    storage.clear();
    // navigationService.clearStackAndShow(Routes.homeView);
  }

  Future<bool> updateProfileData(dio.FormData formData) async {
    try {
      final res = await _client.post("user/update", data: formData);

      _user = User.fromJson(res.data["user"]);

      this.storeUserData(token: _token!, user: _user!);

      return true;
    } catch (e) {}

    return false;
  }

  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return "${packageInfo.version}+${packageInfo.buildNumber}";
  }

  Future<bool> phoneExists(String phoneNumber) async {
    try {
      final res = await _httpService.client.post("phone-exists", data: {
        "phone_number": phoneNumber,
      });

      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {}

    return false;
  }

  Future<bool> resetPassword(Map<String, String> data) async {
    try {
      final res = await _httpService.client.post("reset-password", data: data);

      return res.data["updated"];
    } catch (e) {}

    return false;
  }

  void setAge(int age) {
    _selectedAgeValue = age;
  }

  void setHeight(int height) {
    _selectedHeightValue = height;
  }

  void saveSignUpValues(Map<String, dynamic> signUp) {
    signUp.forEach((key, value) {
      _signupValues[key] = value;
    });
  }

  void setWeight(double weight) {
    _selectedWeightValue = weight;
  }

  void saveAgeWeightHeight() {
    _signupValues["height"] = _selectedHeightValue;
    _signupValues["weight"] = _selectedWeightValue;
    _signupValues["age"] = _selectedAgeValue;
  }
}
