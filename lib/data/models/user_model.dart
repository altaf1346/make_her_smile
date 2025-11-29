class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? partnerName;
  final DateTime? partnerBirthday;
  final List<String> tags;

  UserModel({
    required this.id,
    required this.email,
    this.name,
    this.partnerName,
    this.partnerBirthday,
    this.tags = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'partnerName': partnerName,
      'partnerBirthday': partnerBirthday?.toIso8601String(),
      'tags': tags,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'],
      partnerName: map['partnerName'],
      partnerBirthday: map['partnerBirthday'] != null
          ? DateTime.parse(map['partnerBirthday'])
          : null,
      tags: List<String>.from(map['tags'] ?? []),
    );
  }
}
