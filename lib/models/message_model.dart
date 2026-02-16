class MessageModel {
  MessageModel({required this.id, required this.from, required this.to, required this.message, required this.created_at});

  final int? id;
  final int from;
  final int to;
  final String message;
  final String created_at;

  Map<String, dynamic> toMap() {
    return {'id': id, 'from': from, 'to': to, 'message': message, 'created_at': created_at};
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(id: map['id'], from: map['from'], to: map['to'], message: map['message'], created_at: map['created_at']);
  }
}