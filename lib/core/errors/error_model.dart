class ErrorModel {
  final List<String>? errorMessage;

  ErrorModel({
    required this.errorMessage,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData['data'][0] ?? ['Unknown error'],
    );
  }
}
