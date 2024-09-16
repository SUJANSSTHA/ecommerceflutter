import 'package:shared_preferences/shared_preferences.dart';

class sharedPreferenceHelper{
  
  static String userIdkey = "USERKEY";
  static String userNamekey = "USERNAMEKEY";
  static String userEmailkey = "USEREMAILKEY";
  static String userImagekey = "USERIMAGEKEY";

// function to save the data locally using shared_preferences 
// function of set
  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userIdkey, getUserId);

  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userNamekey, getUserName);

  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userEmailkey, getUserEmail);

  }

  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userImagekey, getUserImage);

  }


  //----------------------end set

  Future<String?>getUserId()async{
        SharedPreferences pref = await SharedPreferences.getInstance();
       return pref.getString(userIdkey);
  }

  Future<String?>getUserName()async{
        SharedPreferences pref = await SharedPreferences.getInstance();
       return pref.getString(userNamekey);
  }

  Future<String?>getUserEmail()async{
        SharedPreferences pref = await SharedPreferences.getInstance();
       return pref.getString(userEmailkey);
  }

  Future<String?>getUserImage()async{
        SharedPreferences pref = await SharedPreferences.getInstance();
       return pref.getString(userImagekey);
  }



}