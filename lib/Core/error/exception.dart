import 'package:shop_app/Core/Network/error_message_network.dart';

class ServerException implements Exception{
  final ErrorMessageNetwork errorMessageNetwork;

  const ServerException({required this.errorMessageNetwork});
}