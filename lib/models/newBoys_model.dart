class NewBoysModel {
  final int id;
  final String name;
  final String imageUrl;
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
  final String fatherOccupation;
  final String fatherPhone;
  final String guardianName;
  final String guardianNationalId;
  final String parentsStatus;
  final String guardianPhoneNumber;
  final String guardianRelation;
  final String housingType;
  final int housingWithoutCatering;
  final int familyAbroad;
  final int specialNeed;
  final int secondaryEducationTotalScore;
  final int secondaryEducationRate;
  final int secondaryEducationAbroad;
  final String secondaryEducationDivision;
  final String password;
  final int collegeId;
  final int levelId;
  final int governorateId;
  final int cityId;
  final String address;
  final dynamic buildingId;
  final dynamic employeeId;
  final dynamic adminId;
  final String confirmPassword;

  NewBoysModel({
    required this.id,
    required this.name,
    required this.imageUrl,
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
    required this.housingWithoutCatering,
    required this.familyAbroad,
    required this.specialNeed,
    required this.secondaryEducationTotalScore,
    required this.secondaryEducationRate,
    required this.secondaryEducationAbroad,
    required this.secondaryEducationDivision,
    required this.password,
    required this.collegeId,
    required this.levelId,
    required this.governorateId,
    required this.cityId,
    required this.address,
    required this.buildingId,
    required this.employeeId,
    required this.adminId,
    required this.confirmPassword,
  });

  factory NewBoysModel.fromJson(Map<String, dynamic> json) => NewBoysModel(
    id: json["id"],
    name: json["name"],
    imageUrl: json["image_url"],
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
    housingWithoutCatering: json["HousingWithoutCatering"],
    familyAbroad: json["FamilyAbroad"],
    specialNeed: json["SpecialNeed"],
    secondaryEducationTotalScore: json["SecondaryEducationTotalScore"],
    secondaryEducationRate: json["SecondaryEducationRate"],
    secondaryEducationAbroad: json["SecondaryEducationAbroad"],
    secondaryEducationDivision: json["SecondaryEducationDivision"],
    password: json["password"],
    collegeId: json["college_id"],
    levelId: json["level_id"],
    governorateId: json["governorate_id"],
    cityId: json["city_id"],
    address: json["address"],
    buildingId: json["building_id"],
    employeeId: json["employee_id"],
    adminId: json["admin_id"],
    confirmPassword: json["ConfirmPassword"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
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
    "HousingWithoutCatering": housingWithoutCatering,
    "FamilyAbroad": familyAbroad,
    "SpecialNeed": specialNeed,
    "SecondaryEducationTotalScore": secondaryEducationTotalScore,
    "SecondaryEducationRate": secondaryEducationRate,
    "SecondaryEducationAbroad": secondaryEducationAbroad,
    "SecondaryEducationDivision": secondaryEducationDivision,
    "password": password,
    "college_id": collegeId,
    "level_id": levelId,
    "governorate_id": governorateId,
    "city_id": cityId,
    "address": address,
    "building_id": buildingId,
    "employee_id": employeeId,
    "admin_id": adminId,
    "ConfirmPassword": confirmPassword,
  };
}
