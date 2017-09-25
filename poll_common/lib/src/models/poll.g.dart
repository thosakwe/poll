// GENERATED CODE - DO NOT MODIFY BY HAND

part of poll_common.src.models.poll;

// **************************************************************************
// Generator: JsonModelGenerator
// **************************************************************************

class Poll extends _Poll {
  @override
  String id;

  @override
  String title;

  @override
  String description;

  @override
  List<String> answers;

  @override
  DateTime createdAt;

  @override
  DateTime updatedAt;

  Poll(
      {this.id,
      this.title,
      this.description,
      this.answers,
      this.createdAt,
      this.updatedAt});

  factory Poll.fromJson(Map data) {
    return new Poll(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        answers: data['answers'],
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
        'title': title,
        'description': description,
        'answers': answers,
        'created_at': createdAt == null ? null : createdAt.toIso8601String(),
        'updated_at': updatedAt == null ? null : updatedAt.toIso8601String()
      };

  static Poll parse(Map map) => new Poll.fromJson(map);

  Poll clone() {
    return new Poll.fromJson(toJson());
  }
}
