class RejectMethodModel {
  final List<InsertedStudent> insertedStudents;

  RejectMethodModel({
    required this.insertedStudents,
  });

  factory RejectMethodModel.fromJson(Map<String, dynamic> json) => RejectMethodModel(
    insertedStudents: List<InsertedStudent>.from(json["insertedStudents"].map((x) => InsertedStudent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "insertedStudents": List<dynamic>.from(insertedStudents.map((x) => x.toJson())),
  };
}

class InsertedStudent {
  final String name;
  final String nationalId;
  final String collegeName;

  InsertedStudent({
    required this.name,
    required this.nationalId,
    required this.collegeName,
  });

  factory InsertedStudent.fromJson(Map<String, dynamic> json) => InsertedStudent(
    name: json["name"],
    nationalId: json["national_id"],
    collegeName: json["college_name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "national_id": nationalId,
    "college_name": collegeName,
  };
}
