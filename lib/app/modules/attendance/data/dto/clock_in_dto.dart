// To parse this JSON data, do
//
//     final clockInDto = clockInDtoFromJson(jsonString);

import 'dart:convert';

ClockInDto clockInDtoFromJson(String str) => ClockInDto.fromJson(json.decode(str));

String clockInDtoToJson(ClockInDto data) => json.encode(data.toJson());

class ClockInDto {
    bool? success;
    String? message;
    Data? data;

    ClockInDto({
        this.success,
        this.message,
        this.data,
    });

    factory ClockInDto.fromJson(Map<String, dynamic> json) => ClockInDto(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? timeAttendanceId;
    int? clockInStatus;
    DateTime? clockTime;
    Location? location;
    dynamic isWfh;
    dynamic device;
    dynamic selfieUrl;

    Data({
        this.timeAttendanceId,
        this.clockInStatus,
        this.clockTime,
        this.location,
        this.isWfh,
        this.device,
        this.selfieUrl,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        timeAttendanceId: json["time_attendance_id"],
        clockInStatus: json["clock_in_status"],
        clockTime: json["clock_time"] == null ? null : DateTime.parse(json["clock_time"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        isWfh: json["is_wfh"],
        device: json["device"],
        selfieUrl: json["selfie_url"],
    );

    Map<String, dynamic> toJson() => {
        "time_attendance_id": timeAttendanceId,
        "clock_in_status": clockInStatus,
        "clock_time": clockTime?.toIso8601String(),
        "location": location?.toJson(),
        "is_wfh": isWfh,
        "device": device,
        "selfie_url": selfieUrl,
    };
}

class Location {
    double? latitude;
    double? longitude;

    Location({
        this.latitude,
        this.longitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}
