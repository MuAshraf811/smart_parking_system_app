import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class UrlHandler {
  static late final responseLogin;
  static String Url = "http://localhost/my-api/api.php" ;
  

  static Future< List<dynamic> > getLocations() async {
    String action = '?action=get_locations';
    final Uri uri = Uri.parse(Url+action);
    var response = await http.get(uri);
    print(response.body);
    print("gggggggggggggggggggggggggggggggggggggggggggggg");
    if(response.statusCode == 200){
      var res = convert.jsonDecode(response.body );
      return res;
    }
    else {
      throw 'get error';
    }
  }
  static Future< List<dynamic> > getUsers() async {
    String action = '?action=get_users';
    final Uri uri = Uri.parse(Url+action);
    var response = await http.get(uri);
    print(response.body);
    print("gggggggggggggggggggggggggggggggggggggggggggggg");
    if(response.statusCode == 200){
      var res = convert.jsonDecode(response.body );
      return res;
    }
    else {
      throw 'get error';
    }
  }

  static Future< void >  postUserData({
    required String name,
    required String phoneNum,
    required String email,
    required String password,
    required String carNum,
  }) async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'add_user',
      'name': name,
      'phoneNum': phoneNum,
      'email': email,
      'password': password,
      'carNum': carNum,
    };
    var response = await http.post(uri, body: data);
    print(response.body);
    if(response.statusCode == 200){

      print('post data success');
    }
    else {
      throw 'post error';
    }
  }
  static Future< void >  updateUserData() async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'update_user',
      'oldPhoneNum' : 'r',
      'name': 'ramiiiii',
      'phoneNum': 'g',
      'email': 'g',
      'password': 'g',
      'carNum': 'g',
    };
    var response = await http.post(uri, body: data);
    print(response.body);
    if(response.statusCode == 200){
      print('update data success');
    }
    else {
      throw 'post error';
    }
  }
  static Future< void >  deleteUser() async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'delete_user',
      'phoneNum' : 'g',
    };
    var response = await http.post(uri, body: data);
    print(response.body);
    if(response.statusCode == 200){
      print('delete data success');
    }
    else {
      throw 'post error';
    }
  }
  static Future<int>  logIn({
    required String userName,
    required String pass
}) async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'login',
      'email' : userName,
      'password' : pass,
    };
    var responseLogin = await http.post(uri, body: data);
    print(responseLogin.body);
    if(responseLogin.statusCode == 200){
      print('login data success');
      return 0 ; ///
    }
    else {
      throw 'post error';
    }
  }

}