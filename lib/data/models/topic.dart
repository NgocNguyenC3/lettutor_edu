// ignore_for_file: public_member_api_docs= '', sort_constructors_first
class Topic {
  int id;
  int numberOfPages;
  String key;
  String name;
  String nameFile;

  Topic({
    this.id = 0,
    this.key = '',
    this.name = '',
    this.nameFile = '',
    this.numberOfPages = 0,
  });

  factory Topic.fromJson(json) {
    return Topic(
      id: json['id'] ?? 0,
      key: json['key'] ?? '',
      name: json['name'] ?? '',
      nameFile: json['nameFile'] ?? '',
      numberOfPages: json['numberOfPages'] ?? 0,
    );
  }
}
