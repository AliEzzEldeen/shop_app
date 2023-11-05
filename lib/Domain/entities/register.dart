class Register {
  final bool? status;
  final String? message;
  final RegisterData? data;

  Register({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class RegisterData {
  final String? email;
  final String? name;
  final int? phone;
  final int? id;
  final String? image;
  final String? token;

  RegisterData({
    required this.email,
    required this.name,
    required this.phone,
    required this.id,
    required this.image,
    required this.token,
  });

  @override
  List<Object?> get props => [
        email,
        name,
        phone,
        id,
        image,
        token,
      ];
}
