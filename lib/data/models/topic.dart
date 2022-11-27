// ignore_for_file: public_member_api_docs= '', sort_constructors_first
class Topic {
  int id;
  String key;
  String name;
  Topic({
    this.id = 0,
    this.key = '',
    this.name = '',
  });

  factory Topic.fromJson(json) {
    return Topic(
      id: json['id'] ?? 0,
      key: json['key'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
