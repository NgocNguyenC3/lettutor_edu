// ignore_for_file: public_member_api_docs= '', sort_constructors_first
import 'package:lettutor_edu_clone/data/models/feed_back.dart';
import 'package:lettutor_edu_clone/data/models/user.dart';
import 'package:lettutor_edu_clone/util/date_time.dart';
import 'package:intl/intl.dart';

class Tutor {
  double rating;
  int price;
  String userId;
  String id;
  String phoneAuth;
  String caredByStaffId;
  String video;
  String bio;
  String education;
  String experience;
  String profession;
  String accent;
  String targetStudent;
  String interests;
  String specialties;
  String resume;

  bool requestPassword;
  bool isPhoneAuthActivated;
  bool isNative;
  bool isPublicRecord;
  UserModel? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  List<String> studentGroupId;
  List<Feedback> feedbacks;

  Tutor({
    this.rating = 0,
    this.userId = '',
    this.id = '',
    this.phoneAuth = '',
    this.caredByStaffId = '',
    this.video = '',
    this.bio = '',
    this.education = '',
    this.experience = '',
    this.profession = '',
    this.accent = '',
    this.targetStudent = '',
    this.interests = '',
    this.specialties = '',
    this.resume = '',
    this.price = 0,
    this.requestPassword = false,
    this.isPhoneAuthActivated = false,
    this.isNative = false,
    this.isPublicRecord = false,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId = const [],
    this.feedbacks = const [],
  });

  factory Tutor.fromJson(json) {
    return Tutor(
      rating: json['rating'] ?? 0,
      userId: json['userId'] ?? '',
      id: json['id'] ?? '',
      phoneAuth: json['phoneAuth'] ?? '',
      caredByStaffId: json['caredByStaffId'] ?? '',
      video: json['video'] ?? '',
      bio: json['bio'] ?? '',
      education: json['education'] ?? '',
      experience: json['experience'] ?? '',
      profession: json['profession'] ?? '',
      accent: json['accent'] ?? '',
      targetStudent: json['targetStudent'] ?? '',
      interests: json['interests'] ?? '',
      specialties: json['specialties'] ?? '',
      resume: json['resume'] ?? '',
      price: json['price'] ?? 0,
      requestPassword: json['requestPassword'] ?? false,
      isPhoneAuthActivated: json['isPhoneAuthActivated'] ?? false,
      isNative: json['isNative'] ?? false,
      isPublicRecord: json['isPublicRecord'] ?? false,
      user: UserModel.fromJson(json),
      createdAt: json['createdAt'] != null
          ? DateFormat(time1).parse(json['createdAt'])
          : DateTime(1990),
      updatedAt: json['updatedAt'] != null
          ? DateFormat(time1).parse(json['updatedAt'])
          : DateTime(1990),
      deletedAt: json['deletedAt'] != null
          ? DateFormat(time1).parse(json['deletedAt'])
          : DateTime(1990),
      studentGroupId: json['studentGroupId'] == null
          ? []
          : (json['studentGroupId'] as List).map((e) => e.toString()).toList(),
      feedbacks: json['feedbacks'] == null
          ? []
          : (json['feedbacks'] as List)
              .map((e) => Feedback.fromJson(e))
              .toList(),
    );
  }
}
