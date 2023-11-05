class LoginData {
  final int id;
  final int points;
  final int credit;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  LoginData({
    required this.id,
    required this.points,
    required this.credit,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  @override
  List<Object> get props => [
        id,
        points,
        credit,
        name,
        email,
        phone,
        image,
        token,
      ];
}
