class RejectStudentModel {
  final int id;
  final String name;
  final String nationalId;
  final String collegeName;

  RejectStudentModel({
    required this.id,
    required this.name,
    required this.nationalId,
    required this.collegeName,
  });

  factory RejectStudentModel.fromJson(Map<String, dynamic> json) => RejectStudentModel(
    id: json["id"],
    name: json["name"],
    nationalId: json["national_id"],
    collegeName: json["college_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "national_id": nationalId,
    "college_name": collegeName,
  };
}
