class UsrsChatModel {
  UsrsChatModel({required this.chat_id, required this.user_id});

  final int? chat_id;
  final int user_id;

  Map<String, dynamic> toMap() {
    return {'chat_id': chat_id, 'user_id': user_id};
  }

  factory UsrsChatModel.fromMap(Map<String, dynamic> map) {
    return UsrsChatModel(chat_id: map['chat_id'], user_id: map['user_id']);
  }
}