// GENERATED CODE - DO NOT MODIFY BY HAND

part of poll_common.src.models.vote;

// **************************************************************************
// Generator: JsonModelGenerator
// **************************************************************************

class Vote extends _Vote {
  @override
  String id;

  @override
  String pollId;

  @override
  int answerIndex;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  Vote(
      {this.id, this.pollId, this.answerIndex, this.createdAt, this.updatedAt});

  factory Vote.fromJson(Map data) {
    return new Vote(
        id: data['id'],
        pollId: data['poll_id'],
        answerIndex: data['answer_index'],
        createdAt: data['created_at'] is DateTime
            ? data['created_at']
            : (data['created_at'] is String
                ? DateTime.parse(data['created_at'])
                : null),
        updatedAt: data['updated_at'] is DateTime
            ? data['updated_at']
            : (data['updated_at'] is String
                ? DateTime.parse(data['updated_at'])
                : null));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'poll_id': pollId,
        'answer_index': answerIndex,
        'created_at': createdAt == null ? null : createdAt.toIso8601String(),
        'updated_at': updatedAt == null ? null : updatedAt.toIso8601String()
      };

  static Vote parse(Map map) => new Vote.fromJson(map);

  Vote clone() {
    return new Vote.fromJson(toJson());
  }
}
