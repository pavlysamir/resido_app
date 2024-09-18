import 'package:equatable/equatable.dart';

class ErrorModel {
  final List<dynamic>? errorMessage;

  ErrorModel({
    required this.errorMessage,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData['data'] ?? ['Unknown error'],
    );
  }
}

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
      success: json["success"],
    );
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
