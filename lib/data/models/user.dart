// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

import 'package:lettutor_edu_clone/data/models/topic.dart';
import 'package:lettutor_edu_clone/util/date_time.dart';

class UserModel {
  int timezone;
  String id;
  String email;
  String name;
  String avatar;
  String country;
  String languages;
  String level;
  String google;
  String facebook;
  String apple;
  String phone;
  String studySchedule;
  List<String> roles;
  bool isActivated;
  bool isPhoneActivated;
  bool canSendMessage;
  bool isOnline;
  //language
  //walletInfo
  DateTime birthday;
  List<Topic> learnTopics;
  List<Topic> testPreparations;
  UserModel({
    this.timezone = 7,
    this.id = '',
    this.email = '',
    this.name = '',
    this.avatar = '',
    this.country = '',
    this.languages = '',
    this.level = "",
    this.google = '',
    this.facebook = '',
    this.apple = '',
    this.phone = '',
    this.studySchedule = '',
    this.roles = const [],
    this.learnTopics = const [],
    this.testPreparations = const [],
    this.isActivated = false,
    this.isPhoneActivated = false,
    this.canSendMessage = false,
    this.isOnline = false,
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
      google: json['google'] ?? "",
      facebook: json['facebook'] ?? "",
      apple: json['apple'] ?? "",
      phone: json['phone'] ?? "",
      studySchedule: json['studySchedule'] ?? "",
      isOnline: json['isOnline'] ?? false,
      roles: json['roles'] == null
          ? []
          : (json['roles'] as List).map((e) => e.toString()).toList(),
      learnTopics: json['learnTopics'] == null
          ? []
          : (json['learnTopics'] as List)
              .map((e) => Topic.fromJson(e))
              .toList(),
      testPreparations: json['testPreparations'] == null
          ? []
          : (json['testPreparations'] as List)
              .map((e) => Topic.fromJson(e))
              .toList(),
      isActivated: json['isActivated'] ?? false,
      isPhoneActivated: json['isPhoneActivated'] ?? false,
      canSendMessage: json['canSendMessage'] ?? false,
      birthday: json['birthday'] != null
          ? DateFormat(time1).parse(json['birthday'])
          : DateTime(1990),
    );
  }

  List<Topic> getListWanttoLearn() => [...learnTopics, ...testPreparations];
}
