import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class UrlHandler {
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

  static Future< void >  postUserData() async {
    final Uri uri = Uri.parse(Url);
    var data = {
      'action' : 'add_user',
      'name': 'rami',
      'phoneNum': 'r',
      'email': 'r',
      'password': 'r',
      'carNum': 'r',
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

}