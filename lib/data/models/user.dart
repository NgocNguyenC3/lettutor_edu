// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class UserModel {
  int timezone;
  String id;
  String email;
  String name;
  String avatar;
  String country;
  String languages;
  String level;
  List<String> roles;
  bool isActivated;
  bool isPhoneActivated;
  bool canSendMessage;
  //language
  //walletInfo
  DateTime birthday;
  UserModel({
    this.timezone = 7,
    this.id = '',
    this.email = '',
    this.name = '',
    this.avatar = '',
    this.country = '',
    this.languages = '',
    this.roles = const [],
    this.isActivated = false,
    this.isPhoneActivated = false,
    this.canSendMessage = false,
    this.level = "",
    required this.birthday,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json['id'] ?? "",
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      avatar: json['avatar'] ?? "",
      country: json['country'] ?? "",
      level: json['level'] ?? "",
      timezone: json['timezone'] ?? 7,
      languages: json['languages'] ?? "",
      roles: (json['roles'] as List).map((e) => e.toString()).toList(),
      isActivated: json['isActivated'] ?? false,
      isPhoneActivated: json['isPhoneActivated'] ?? false,
      canSendMessage: json['canSendMessage'] ?? false,
      birthday: json['birthday'] != null
          ? DateFormat('YYYY-MM-dd').parse(json['birthday'])
          : DateTime(1990),
    );
  }
}
