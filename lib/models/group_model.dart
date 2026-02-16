class GroupModel {
  GroupModel({required this.id, required this.owner_id, required this.name, required this.desc});

  final int? id;
  final int owner_id;
  final String name;
  final String desc;

  Map<String, dynamic> toMap() {
    return {'id': id, 'owner_id': owner_id, 'name': name, 'desc': desc};
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(id: map['id'], owner_id: map['owner_id'], name: map['name'], desc: map['desc']);
  }
}