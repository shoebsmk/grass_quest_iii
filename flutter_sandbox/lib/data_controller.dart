import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataController extends GetxController {
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', 'JohnDoe');
    prefs.setInt('age', 30);
    prefs.setBool('isPremiumUser', true);
    print("object");
  }

// Read data
  Future<void> readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    int age = prefs.getInt('age') ?? 0;
    bool isPremiumUser = prefs.getBool('isPremiumUser') ?? false;
    print('Username: $username, Age: $age, Premium User: $isPremiumUser');
  }

  Future<void> satFirstLaunch(bool is_first_launch) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_launch', is_first_launch);
  }

// Read data
  Future<bool> chechFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool is_first_launch = prefs.getBool('first_launch') ?? false;
    return is_first_launch;
  }

  RxBool isFirstTimeUser = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTimeUser.value = prefs.getBool('isFirstTimeUser') ?? true;
  }

  Future<void> updateIsFirstTimeUser(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTimeUser', value);
    isFirstTimeUser.value = value;
  }
}
