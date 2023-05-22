import 'API_Handler.dart';

class UserData {
  final String name;
  final String carNum;
  final String email;
  final String phone;

  UserData({
    required this.carNum,
    required this.phone,
    required this.name,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      carNum: json['carNum'],
      phone: json['phoneNum'],
    );
  }
  static Future<List<UserData>> converting() async {
    final value = await UrlHandler.getUserData(id: '1');
    return value.map((e) {
      return UserData(carNum: '', phone: '', name: '', email: '');
    }).toList();
  }
}