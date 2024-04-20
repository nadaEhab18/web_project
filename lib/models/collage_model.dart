class CollagesModel {
  final int id;
  final String name;

  CollagesModel({
    required this.id,
    required this.name,
  });

  factory CollagesModel.fromJson(Map<String, dynamic> json) => CollagesModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}