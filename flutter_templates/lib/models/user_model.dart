class UserModel {
  final String name;
  final String phoneNo;
  final int creditScore;
  UserModel({
    required this.creditScore,
    required this.name,
    required this.phoneNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNo': phoneNo,
      'creditScore': creditScore,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      creditScore: map['creditScore'] ?? 0,
      phoneNo: map['phoneNo'] ?? '',
    );
  }
}
