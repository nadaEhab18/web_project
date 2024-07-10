class AcceptedStudentModel {
  final int id;
  final String name;
  final String nationalId;
  final String collegeName;

  AcceptedStudentModel({
    required this.id,
    required this.name,
    required this.nationalId,
    required this.collegeName,
  });

  factory AcceptedStudentModel.fromJson(Map<String, dynamic> json) => AcceptedStudentModel(
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