import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedpreference;
  static  init() async {
    sharedpreference = await SharedPreferences.getInstance();
  }
   static Future <bool> savedata({
    required String key , 
    required dynamic value ,
  }) async {
     if (value is String ) {
       return await sharedpreference.setString(key, value) ;
     } 
     else if (value is int ){
      return await sharedpreference.setInt(key, value) ;
     }
     else if (value is bool ){
      return await sharedpreference.setBool(key, value) ;
     }
     else {
       return await sharedpreference.setDouble(key, value) ;
     }

  }
  static dynamic getdata({
    required String key  , 
  }){
    return sharedpreference.get(key) ; 
  }



  static Future<bool>  removedata({
    required String  key , 
  })async{
    return  await sharedpreference.remove(key );
  }
  
}
