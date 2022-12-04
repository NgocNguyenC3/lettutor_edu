// ignore_for_file: public_member_api_docs='', sort_constructors_first
import 'package:intl/intl.dart';

import 'package:lettutor_edu_clone/util/date_time.dart';

class Schedule {
  String id;
  String tutorId;
  String startTime;
  String endTime;

  int startTimestamp;
  int endTimestamp;
  bool isBooked;
  DateTime? createdAt;
  Schedule({
    this.id = '',
    this.tutorId = '',
    this.startTime = '',
    this.endTime = '',
    this.startTimestamp = 0,
    this.endTimestamp = 0,
    this.isBooked = false,
    this.createdAt,
  });

  factory Schedule.fromJson(json) {
    return Schedule(
      id: json['id'] ?? '',
      tutorId: json['tutorId'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      startTimestamp: json['startTimestamp'] ?? 0,
      endTimestamp: json['endTimestamp'] ?? 0,
      isBooked: json['isBooked'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateFormat(time1).parse(json['createdAt'])
          : DateTime(1990),
    );
  }
}
