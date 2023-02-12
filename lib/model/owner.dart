class Owner {
  final int? id;
  final String? login;
  final String? avatar_url;

  const Owner({
    required this.id,
    required this.login,
    required this.avatar_url
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
        id: json['id'],
        login: json['login'],
        avatar_url: json['avatar_url']
    );
  }
}
