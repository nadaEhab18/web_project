class BuildingsModel {
  final int id;
  final int number;
  final String gender;
  final int numberOfRooms;
  final int numberOfFloors;

  BuildingsModel({
    required this.id,
    required this.number,
    required this.gender,
    required this.numberOfRooms,
    required this.numberOfFloors,
  });

  factory BuildingsModel.fromJson(Map<String, dynamic> json) => BuildingsModel(
    id: json["id"],
    number: json["number"],
    gender: json["gender"],
    numberOfRooms: json["number_of_rooms"],
    numberOfFloors: json["number_of_floors"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "gender": gender,
    "number_of_rooms": numberOfRooms,
    "number_of_floors": numberOfFloors,
  };
}
