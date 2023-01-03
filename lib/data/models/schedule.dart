// ignore_for_file: public_member_api_docs='', sort_constructors_first
import 'package:intl/intl.dart';

import 'package:lettutor_edu_clone/data/models/tutor.dart';
import 'package:lettutor_edu_clone/util/date_time.dart';

class Schedule {
  String id;
  String tutorId;
  String startTime;
  String endTime;

  int startTimestamp;
  int endTimestamp;
  bool isBooked;
  bool showRecordUrl;
  DateTime? createdAt;
  String studentRequest;
  String date;
  Tutor? tutorInfo;
  Schedule? scheduleDetailInfo;
  Schedule? scheduleInfo;
  List<Schedule> scheduleDetails;
  Schedule(
      {this.id = '',
      this.tutorId = '',
      this.startTime = '',
      this.endTime = '',
      this.startTimestamp = 0,
      this.endTimestamp = 0,
      this.isBooked = false,
      this.showRecordUrl = false,
      this.createdAt,
      this.studentRequest = '',
      this.date = '',
      this.tutorInfo,
      this.scheduleDetailInfo,
      this.scheduleDetails = const [],
      this.scheduleInfo});

  factory Schedule.fromJson(json) {
    return Schedule(
      id: json['id'] ?? '',
      tutorId: json['tutorId'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      startTimestamp: json['startTimestamp'] ?? 0,
      endTimestamp: json['endTimestamp'] ?? 0,
      isBooked: json['isBooked'] ?? false,
      showRecordUrl: json['showRecordUrl'] ?? false,
      createdAt: json['createdAt'] != null
          ? DateFormat(time1).parse(json['createdAt'])
          : DateTime(1990),
      studentRequest: json['studentRequest'] ?? '',
      date: json['date'] ?? '',
      tutorInfo: json['tutorInfo'] != null
          ? Tutor.fromJson(json['tutorInfo'])
          : Tutor(),
      scheduleDetailInfo: json['scheduleDetailInfo'] != null
          ? Schedule.fromJson(json['scheduleDetailInfo'])
          : Schedule(),
      scheduleInfo: json['scheduleInfo'] != null
          ? Schedule.fromJson(json['scheduleInfo'])
          : Schedule(),
      scheduleDetails: json['scheduleDetails'] != null
          ? (json['scheduleDetails'] as List)
              .map((e) => Schedule.fromJson(e))
              .toList()
          : [],
    );
  }
}
