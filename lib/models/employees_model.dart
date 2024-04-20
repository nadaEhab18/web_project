class EmployeesModel {
  final int id;
  final String name;
  final String nationalId;

  EmployeesModel({
    required this.id,
    required this.name,
    required this.nationalId,
  });

  factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
    id: json["id"],
    name: json["name"],
    nationalId: json["national_ID"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "national_ID": nationalId,
  };
}