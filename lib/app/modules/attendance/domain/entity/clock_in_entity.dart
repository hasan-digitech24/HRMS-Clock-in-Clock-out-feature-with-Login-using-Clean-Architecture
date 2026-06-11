// To parse this JSON data, do
//
//     final clockInEntity = clockInEntityFromJson(jsonString);

import 'dart:convert';

ClockInEntity clockInEntityFromJson(String str) => ClockInEntity.fromJson(json.decode(str));

String clockInEntityToJson(ClockInEntity data) => json.encode(data.toJson());

class ClockInEntity {
    String? type;
    double? latitude;
    double? longitude;
    int? timeAttendanceId;

    ClockInEntity({
        this.type,
        this.latitude,
        this.longitude,
        this.timeAttendanceId,
    });

    factory ClockInEntity.fromJson(Map<String, dynamic> json) => ClockInEntity(
        type: json["type"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timeAttendanceId: json["time_attendance_id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "time_attendance_id": timeAttendanceId,
    };
}
