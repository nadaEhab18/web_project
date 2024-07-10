class OldGirlsModel {
  final int id;
  final String name;
  final String? email;
  final int eygptian;
  final String nationalId;
  final String studentCode;
  final DateTime birthDate;
  final String gender;
  final String religion;
  final String phoneNumber;
  final String mobileNumber;
  final String fatherName;
  final String fatherNationalId;
  final String? fatherOccupation;
  final String fatherPhone;
  final String guardianName;
  final String guardianNationalId;
  final String? parentsStatus;
  final String guardianPhoneNumber;
  final String guardianRelation;
  final String housingType;
  final int successRate;
  final int housingWithoutCatering;
  final String housingInPreviousYear;
  final int familyAbroad;
  final int specialNeed;
  final String password;
  final String confirmPassword;
  final int collegeId;
  final String department;
  final int levelId;
  final int gpaId;
  final int governorateId;
  final int cityId;
  final String address;
  final dynamic adminId;
  final dynamic employeeId;
  final dynamic buildingId;

  OldGirlsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.eygptian,
    required this.nationalId,
    required this.studentCode,
    required this.birthDate,
    required this.gender,
    required this.religion,
    required this.phoneNumber,
    required this.mobileNumber,
    required this.fatherName,
    required this.fatherNationalId,
    required this.fatherOccupation,
    required this.fatherPhone,
    required this.guardianName,
    required this.guardianNationalId,
    required this.parentsStatus,
    required this.guardianPhoneNumber,
    required this.guardianRelation,
    required this.housingType,
    required this.successRate,
    required this.housingWithoutCatering,
    required this.housingInPreviousYear,
    required this.familyAbroad,
    required this.specialNeed,
    required this.password,
    required this.confirmPassword,
    required this.collegeId,
    required this.department,
    required this.levelId,
    required this.gpaId,
    required this.governorateId,
    required this.cityId,
    required this.address,
    required this.adminId,
    required this.employeeId,
    required this.buildingId,
  });

  factory OldGirlsModel.fromJson(Map<String, dynamic> json) => OldGirlsModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    eygptian: json["Eygptian"],
    nationalId: json["nationalID"],
    studentCode: json["studentCode"],
    birthDate: DateTime.parse(json["birthDate"]),
    gender: json["gender"],
    religion: json["religion"],
    phoneNumber: json["phoneNumber"],
    mobileNumber: json["mobileNumber"],
    fatherName: json["fatherName"],
    fatherNationalId: json["fatherNationalID"],
    fatherOccupation: json["fatherOccupation"],
    fatherPhone: json["fatherPhone"],
    guardianName: json["GuardianName"],
    guardianNationalId: json["GuardianNationalID"],
    parentsStatus: json["ParentsStatus"],
    guardianPhoneNumber: json["GuardianPhoneNumber"],
    guardianRelation: json["GuardianRelation"],
    housingType: json["HousingType"],
    successRate: json["successRate"],
    housingWithoutCatering: json["HousingWithoutCatering"],
    housingInPreviousYear: json["HousingInPreviousYear"],
    familyAbroad: json["FamilyAbroad"],
    specialNeed: json["SpecialNeed"],
    password: json["password"],
    confirmPassword: json["ConfirmPassword"],
    collegeId: json["college_id"],
    department: json["Department"],
    levelId: json["level_id"],
    gpaId: json["gpa_id"],
    governorateId: json["governorate_id"],
    cityId: json["city_id"],
    address: json["address"],
    adminId: json["admin_id"],
    employeeId: json["employee_id"],
    buildingId: json["building_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "Eygptian": eygptian,
    "nationalID": nationalId,
    "studentCode": studentCode,
    "birthDate": birthDate.toIso8601String(),
    "gender": gender,
    "religion": religion,
    "phoneNumber": phoneNumber,
    "mobileNumber": mobileNumber,
    "fatherName": fatherName,
    "fatherNationalID": fatherNationalId,
    "fatherOccupation": fatherOccupation,
    "fatherPhone": fatherPhone,
    "GuardianName": guardianName,
    "GuardianNationalID": guardianNationalId,
    "ParentsStatus": parentsStatus,
    "GuardianPhoneNumber": guardianPhoneNumber,
    "GuardianRelation": guardianRelation,
    "HousingType": housingType,
    "successRate": successRate,
    "HousingWithoutCatering": housingWithoutCatering,
    "HousingInPreviousYear": housingInPreviousYear,
    "FamilyAbroad": familyAbroad,
    "SpecialNeed": specialNeed,
    "password": password,
    "ConfirmPassword": confirmPassword,
    "college_id": collegeId,
    "Department": department,
    "level_id": levelId,
    "gpa_id": gpaId,
    "governorate_id": governorateId,
    "city_id": cityId,
    "address": address,
    "admin_id": adminId,
    "employee_id": employeeId,
    "building_id": buildingId,
  };
}
