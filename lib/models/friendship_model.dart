class FriendshipModel {
  FriendshipModel({required this.friend1, required this.friend2});

  final int friend1;
  final int friend2;

  Map<String, int> toMap() {
    return {'friend1': friend1, 'friend2': friend2};
  }

  factory FriendshipModel.fromMap(Map<String, dynamic> map) {
    return FriendshipModel(friend1: map['friend1'], friend2: map['friend2']);
  }
}