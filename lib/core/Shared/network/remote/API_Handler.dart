import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class UrlHandler {
  static String Url = "http://localhost/my-api/api.php" ;

  static Future< List<dynamic> > getLocations() async {
    String action = '?action=get_locations';
    final Uri uri = Uri.parse(Url+action);
    var response = await http.get(uri);
    print(response.body);

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



  static Future< void >  updateUserData({
    required String id,
    required String name,
    required String phoneNum,
    required String email,
    required String password,
    required String carNum,
}) async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'update_user',
      'users_id' : id,
      'name': name,
      'phoneNum': phoneNum,
      'email': email,
      'password': password,
      'carNum': carNum,
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


  static Future< void >  deleteUser({
    required String id,
}) async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'delete_user',
      'users_id' : id,
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



  static Future  logIn({
    required String userName,
    required String pass
}) async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'login',
      'email' : userName,
      'password' : pass,
    };
    var response = await http.post(uri, body: data);
    print(response.body);
    if(response.statusCode == 200){
      print('login data success');
      var res = convert.jsonDecode(response.body);
      if(res['id'] == null){
        return '0' ;
      }
      else{
        return res['id'];
      } ///
    }
    else {
      throw 'post error';
    }
  }

}