// To parse this JSON data, do
//
//     final loginDto = loginDtoFromJson(jsonString);

import 'dart:convert';

LoginDto loginDtoFromJson(String str) => LoginDto.fromJson(json.decode(str));

String loginDtoToJson(LoginDto data) => json.encode(data.toJson());

class LoginDto {
    bool status;
    String message;
    User user;

    LoginDto({
        required this.status,
        required this.message,
        required this.user,
    });

    factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    int userId;
    String employeeId;
    int officeShiftId;
    String firstName;
    String lastName;
    String username;
    String email;
    DateTime dateOfBirth;
    String gender;
    int eStatus;
    int userRoleId;
    int departmentId;
    int subDepartmentId;
    int designationId;
    int companyId;
    int locationId;
    String viewCompaniesId;
    String salaryTemplate;
    int hourlyGradeId;
    int monthlyGradeId;
    DateTime dateOfJoining;
    String dateOfLeaving;
    String maritalStatus;
    String salary;
    int wagesType;
    String basicSalary;
    String dailyWages;
    String salarySsempee;
    String salarySsempeer;
    String salaryIncomeTax;
    String salaryOvertime;
    String salaryCommission;
    String salaryClaims;
    String salaryPaidLeave;
    String salaryDirectorFees;
    String salaryBonus;
    String salaryAdvancePaid;
    String address;
    String state;
    String city;
    String zipcode;
    String profilePicture;
    String images;
    String profileBackground;
    String resume;
    String skypeId;
    String contactNo;
    String facebookLink;
    String twitterLink;
    String bloggerLink;
    String linkdedinLink;
    String googlePlusLink;
    String instagramLink;
    String pinterestLink;
    String youtubeLink;
    int isActive;
    String lastLoginDate;
    String lastLogoutDate;
    String lastLoginIp;
    int isLoggedIn;
    int onlineStatus;
    String fixedHeader;
    String compactSidebar;
    String boxedWrapper;
    String leaveCategories;
    DateTime createdAt;
    String token;

    User({
        required this.userId,
        required this.employeeId,
        required this.officeShiftId,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.email,
        required this.dateOfBirth,
        required this.gender,
        required this.eStatus,
        required this.userRoleId,
        required this.departmentId,
        required this.subDepartmentId,
        required this.designationId,
        required this.companyId,
        required this.locationId,
        required this.viewCompaniesId,
        required this.salaryTemplate,
        required this.hourlyGradeId,
        required this.monthlyGradeId,
        required this.dateOfJoining,
        required this.dateOfLeaving,
        required this.maritalStatus,
        required this.salary,
        required this.wagesType,
        required this.basicSalary,
        required this.dailyWages,
        required this.salarySsempee,
        required this.salarySsempeer,
        required this.salaryIncomeTax,
        required this.salaryOvertime,
        required this.salaryCommission,
        required this.salaryClaims,
        required this.salaryPaidLeave,
        required this.salaryDirectorFees,
        required this.salaryBonus,
        required this.salaryAdvancePaid,
        required this.address,
        required this.state,
        required this.city,
        required this.zipcode,
        required this.profilePicture,
        required this.images,
        required this.profileBackground,
        required this.resume,
        required this.skypeId,
        required this.contactNo,
        required this.facebookLink,
        required this.twitterLink,
        required this.bloggerLink,
        required this.linkdedinLink,
        required this.googlePlusLink,
        required this.instagramLink,
        required this.pinterestLink,
        required this.youtubeLink,
        required this.isActive,
        required this.lastLoginDate,
        required this.lastLogoutDate,
        required this.lastLoginIp,
        required this.isLoggedIn,
        required this.onlineStatus,
        required this.fixedHeader,
        required this.compactSidebar,
        required this.boxedWrapper,
        required this.leaveCategories,
        required this.createdAt,
        required this.token,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        employeeId: json["employee_id"],
        officeShiftId: json["office_shift_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        eStatus: json["e_status"],
        userRoleId: json["user_role_id"],
        departmentId: json["department_id"],
        subDepartmentId: json["sub_department_id"],
        designationId: json["designation_id"],
        companyId: json["company_id"],
        locationId: json["location_id"],
        viewCompaniesId: json["view_companies_id"],
        salaryTemplate: json["salary_template"],
        hourlyGradeId: json["hourly_grade_id"],
        monthlyGradeId: json["monthly_grade_id"],
        dateOfJoining: DateTime.parse(json["date_of_joining"]),
        dateOfLeaving: json["date_of_leaving"],
        maritalStatus: json["marital_status"],
        salary: json["salary"],
        wagesType: json["wages_type"],
        basicSalary: json["basic_salary"],
        dailyWages: json["daily_wages"],
        salarySsempee: json["salary_ssempee"],
        salarySsempeer: json["salary_ssempeer"],
        salaryIncomeTax: json["salary_income_tax"],
        salaryOvertime: json["salary_overtime"],
        salaryCommission: json["salary_commission"],
        salaryClaims: json["salary_claims"],
        salaryPaidLeave: json["salary_paid_leave"],
        salaryDirectorFees: json["salary_director_fees"],
        salaryBonus: json["salary_bonus"],
        salaryAdvancePaid: json["salary_advance_paid"],
        address: json["address"],
        state: json["state"],
        city: json["city"],
        zipcode: json["zipcode"],
        profilePicture: json["profile_picture"],
        images: json["images"],
        profileBackground: json["profile_background"],
        resume: json["resume"],
        skypeId: json["skype_id"],
        contactNo: json["contact_no"],
        facebookLink: json["facebook_link"],
        twitterLink: json["twitter_link"],
        bloggerLink: json["blogger_link"],
        linkdedinLink: json["linkdedin_link"],
        googlePlusLink: json["google_plus_link"],
        instagramLink: json["instagram_link"],
        pinterestLink: json["pinterest_link"],
        youtubeLink: json["youtube_link"],
        isActive: json["is_active"],
        lastLoginDate: json["last_login_date"],
        lastLogoutDate: json["last_logout_date"],
        lastLoginIp: json["last_login_ip"],
        isLoggedIn: json["is_logged_in"],
        onlineStatus: json["online_status"],
        fixedHeader: json["fixed_header"],
        compactSidebar: json["compact_sidebar"],
        boxedWrapper: json["boxed_wrapper"],
        leaveCategories: json["leave_categories"],
        createdAt: DateTime.parse(json["created_at"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "employee_id": employeeId,
        "office_shift_id": officeShiftId,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "e_status": eStatus,
        "user_role_id": userRoleId,
        "department_id": departmentId,
        "sub_department_id": subDepartmentId,
        "designation_id": designationId,
        "company_id": companyId,
        "location_id": locationId,
        "view_companies_id": viewCompaniesId,
        "salary_template": salaryTemplate,
        "hourly_grade_id": hourlyGradeId,
        "monthly_grade_id": monthlyGradeId,
        "date_of_joining": "${dateOfJoining.year.toString().padLeft(4, '0')}-${dateOfJoining.month.toString().padLeft(2, '0')}-${dateOfJoining.day.toString().padLeft(2, '0')}",
        "date_of_leaving": dateOfLeaving,
        "marital_status": maritalStatus,
        "salary": salary,
        "wages_type": wagesType,
        "basic_salary": basicSalary,
        "daily_wages": dailyWages,
        "salary_ssempee": salarySsempee,
        "salary_ssempeer": salarySsempeer,
        "salary_income_tax": salaryIncomeTax,
        "salary_overtime": salaryOvertime,
        "salary_commission": salaryCommission,
        "salary_claims": salaryClaims,
        "salary_paid_leave": salaryPaidLeave,
        "salary_director_fees": salaryDirectorFees,
        "salary_bonus": salaryBonus,
        "salary_advance_paid": salaryAdvancePaid,
        "address": address,
        "state": state,
        "city": city,
        "zipcode": zipcode,
        "profile_picture": profilePicture,
        "images": images,
        "profile_background": profileBackground,
        "resume": resume,
        "skype_id": skypeId,
        "contact_no": contactNo,
        "facebook_link": facebookLink,
        "twitter_link": twitterLink,
        "blogger_link": bloggerLink,
        "linkdedin_link": linkdedinLink,
        "google_plus_link": googlePlusLink,
        "instagram_link": instagramLink,
        "pinterest_link": pinterestLink,
        "youtube_link": youtubeLink,
        "is_active": isActive,
        "last_login_date": lastLoginDate,
        "last_logout_date": lastLogoutDate,
        "last_login_ip": lastLoginIp,
        "is_logged_in": isLoggedIn,
        "online_status": onlineStatus,
        "fixed_header": fixedHeader,
        "compact_sidebar": compactSidebar,
        "boxed_wrapper": boxedWrapper,
        "leave_categories": leaveCategories,
        "created_at": createdAt.toIso8601String(),
        "token": token,
    };
}
