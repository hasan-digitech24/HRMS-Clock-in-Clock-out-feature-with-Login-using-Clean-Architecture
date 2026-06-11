// To parse this JSON data, do
//
//     final checkStatusDto = checkStatusDtoFromJson(jsonString);

import 'dart:convert';

CheckStatusDto checkStatusDtoFromJson(String str) => CheckStatusDto.fromJson(json.decode(str));

String checkStatusDtoToJson(CheckStatusDto data) => json.encode(data.toJson());

class CheckStatusDto {
    bool? success;
    String? message;
    bool? clockInStatus;
    AttendanceData? attendanceData;

    CheckStatusDto({
        this.success,
        this.message,
        this.clockInStatus,
        this.attendanceData,
    });

    factory CheckStatusDto.fromJson(Map<String, dynamic> json) => CheckStatusDto(
        success: json["success"],
        message: json["message"],
        clockInStatus: json["clock_in_status"],
        attendanceData: json["attendance_data"] == null ? null : AttendanceData.fromJson(json["attendance_data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "clock_in_status": clockInStatus,
        "attendance_data": attendanceData?.toJson(),
    };
}

class AttendanceData {
    int? timeAttendanceId;
    int? employeeId;
    DateTime? attendanceDate;
    DateTime? clockIn;
    String? clockInIpAddress;
    String? clockOut;
    String? clockOutIpAddress;
    String? clockInOut;
    String? clockInLatitude;
    String? clockInLongitude;
    String? clockOutLatitude;
    String? clockOutLongitude;
    DateTime? timeLate;
    DateTime? earlyLeaving;
    DateTime? overtime;
    String? totalWork;
    String? totalRest;
    dynamic isWfh;
    dynamic deviceType;
    dynamic selfieUrl;
    String? attendanceStatus;

    AttendanceData({
        this.timeAttendanceId,
        this.employeeId,
        this.attendanceDate,
        this.clockIn,
        this.clockInIpAddress,
        this.clockOut,
        this.clockOutIpAddress,
        this.clockInOut,
        this.clockInLatitude,
        this.clockInLongitude,
        this.clockOutLatitude,
        this.clockOutLongitude,
        this.timeLate,
        this.earlyLeaving,
        this.overtime,
        this.totalWork,
        this.totalRest,
        this.isWfh,
        this.deviceType,
        this.selfieUrl,
        this.attendanceStatus,
    });

    factory AttendanceData.fromJson(Map<String, dynamic> json) => AttendanceData(
        timeAttendanceId: json["time_attendance_id"],
        employeeId: json["employee_id"],
        attendanceDate: json["attendance_date"] == null ? null : DateTime.parse(json["attendance_date"]),
        clockIn: json["clock_in"] == null ? null : DateTime.parse(json["clock_in"]),
        clockInIpAddress: json["clock_in_ip_address"],
        clockOut: json["clock_out"],
        clockOutIpAddress: json["clock_out_ip_address"],
        clockInOut: json["clock_in_out"],
        clockInLatitude: json["clock_in_latitude"],
        clockInLongitude: json["clock_in_longitude"],
        clockOutLatitude: json["clock_out_latitude"],
        clockOutLongitude: json["clock_out_longitude"],
        timeLate: json["time_late"] == null ? null : DateTime.parse(json["time_late"]),
        earlyLeaving: json["early_leaving"] == null ? null : DateTime.parse(json["early_leaving"]),
        overtime: json["overtime"] == null ? null : DateTime.parse(json["overtime"]),
        totalWork: json["total_work"],
        totalRest: json["total_rest"],
        isWfh: json["is_wfh"],
        deviceType: json["device_type"],
        selfieUrl: json["selfie_url"],
        attendanceStatus: json["attendance_status"],
    );

    Map<String, dynamic> toJson() => {
        "time_attendance_id": timeAttendanceId,
        "employee_id": employeeId,
        "attendance_date": "${attendanceDate!.year.toString().padLeft(4, '0')}-${attendanceDate!.month.toString().padLeft(2, '0')}-${attendanceDate!.day.toString().padLeft(2, '0')}",
        "clock_in": clockIn?.toIso8601String(),
        "clock_in_ip_address": clockInIpAddress,
        "clock_out": clockOut,
        "clock_out_ip_address": clockOutIpAddress,
        "clock_in_out": clockInOut,
        "clock_in_latitude": clockInLatitude,
        "clock_in_longitude": clockInLongitude,
        "clock_out_latitude": clockOutLatitude,
        "clock_out_longitude": clockOutLongitude,
        "time_late": timeLate?.toIso8601String(),
        "early_leaving": earlyLeaving?.toIso8601String(),
        "overtime": overtime?.toIso8601String(),
        "total_work": totalWork,
        "total_rest": totalRest,
        "is_wfh": isWfh,
        "device_type": deviceType,
        "selfie_url": selfieUrl,
        "attendance_status": attendanceStatus,
    };
}
