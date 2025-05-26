// import 'package:shared_preferences/shared_preferences.dart';
//
// enum PerfKeys {
//   email,
//   login_in
// }
//
// class SharedPrefController {
//   late SharedPreferences _sharedPreferences;
//   static SharedPrefController? _instance;
//
//   SharedPrefController._();
//
//   factory SharedPrefController (){
//     return _instance ??= SharedPrefController._();
//   }
//
//   Future<void> iniPreferences() async {
//     _sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   Future<void> save({required String email}) async {
//     await _sharedPreferences.setBool(PerfKeys.login_in.name, true);
//     await _sharedPreferences.setString(PerfKeys.email.name, email);
//   }
//
//   bool get login_in => _sharedPreferences.getBool(PerfKeys.login_in.name)?? false ;
//
//   Future<bool> removeValueFor({required String key})async{
//     if(_sharedPreferences.containsKey(key)){
//       await _sharedPreferences.remove(key);
//     }
//     return false;
//   }
//
//   T? getValueFor<T>({required String key}){
//     if(_sharedPreferences.containsKey(key)){
//       return  _sharedPreferences.get(key) as T;
//     }
//     return null;
//   }
//   Future<bool> clear(){
//     return _sharedPreferences.clear();
//   }
//
// }

