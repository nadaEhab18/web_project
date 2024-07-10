class NewFilterModel {
  final List<InsertedStudent> insertedStudents;

  NewFilterModel({
    required this.insertedStudents,
  });

  factory NewFilterModel.fromJson(Map<String, dynamic> json) => NewFilterModel(
    insertedStudents: List<InsertedStudent>.from(json["insertedStudents"].map((x) => InsertedStudent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "insertedStudents": List<dynamic>.from(insertedStudents.map((x) => x.toJson())),
  };
}

class InsertedStudent {
  final String name;
  final String nationalId;
  final int buildingNumber;
  final String collegeName;

  InsertedStudent({
    required this.name,
    required this.nationalId,
    required this.buildingNumber,
    required this.collegeName,
  });

  factory InsertedStudent.fromJson(Map<String, dynamic> json) => InsertedStudent(
    name: json["name"],
    nationalId: json["nationalID"],
    buildingNumber: json["building_number"],
    collegeName: json["college_name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "nationalID": nationalId,
    "building_number": buildingNumber,
    "college_name": collegeName,
  };
}
