// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lettutor_edu_clone/data/models/user.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_edu_clone/util/date_time.dart';

class Feedback {
  String id;
  String bookingId;
  String firstId;
  String secondId;
  int rating;
  String content;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? firstInfo;

  Feedback({
    this.id = '',
    this.bookingId = '',
    this.firstId = '',
    this.secondId = '',
    this.rating = 0,
    this.content = '',
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  factory Feedback.fromJson(json) {
    return Feedback(
      id: json['id'] ?? '',
      bookingId: json['bookingId'] ?? '',
      firstId: json['firstId'] ?? '',
      secondId: json['secondId'] ?? '',
      rating: json['rating'] ?? 0,
      content: json['content'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateFormat(time).parse(json['createdAt'])
          : DateTime(1990),
      updatedAt: json['updatedAt'] != null
          ? DateFormat(time).parse(json['updatedAt'])
          : DateTime(1990),
      firstInfo: UserModel.fromJson(json['firstInfo']),
    );
  }
}
