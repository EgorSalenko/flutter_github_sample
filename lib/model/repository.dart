import 'package:demo_app/model/owner.dart';

class Repository {
  final int? id;
  final String? name;
  final String? description;
  final Owner? owner;

  const Repository({
    required this.id,
    required this.description,
    required this.name,
    required this.owner
  });

  Repository.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        owner = Owner.fromJson(json['owner']);

  Map toJson() => {'id': id, 'name': name, 'description': description};
}
