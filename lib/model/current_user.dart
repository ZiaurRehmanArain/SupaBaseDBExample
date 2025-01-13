class CurrentUser {
  final int id;
  final String name;
  final String email;

  CurrentUser({required this.id, required this.name, required this.email});
  // Factory constructor to create a TaskModel from JSON
  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }

  // Convert a TaskModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

}