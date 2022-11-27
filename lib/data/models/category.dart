// ignore_for_file: public_member_api_docs='', sort_constructors_first
class Category {
  String id;
  String description;
  String key;
  Category({
    this.id = '',
    this.description = '',
    this.key = '',
  });

  factory Category.fromJson(json) {
    return Category(
      id: json['id'] ?? '',
      description: json['description'] ?? '',
      key: json['key'] ?? '',
    );
  }
}
