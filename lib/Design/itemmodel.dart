class Item {
  final String id;
  final String fullName;
  final String email;
  final String city;
  final String mobile;
  bool isFavorite;

  Item({
    required this.id,
    required this.fullName,
    required this.email,
    required this.city,
    required this.mobile,
    this.isFavorite = false,
  });

  // Convert from Map
  factory Item.fromMap(Map<String, String> map) {
    return Item(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      city: map['city'] ?? '',
      mobile: map['mobile'] ?? '',
    );
  }

  // Convert to Map
  Map<String, String> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'city': city,
      'mobile': mobile,
    };
  }
}
