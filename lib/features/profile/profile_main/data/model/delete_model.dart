class DeleteModel {
  final String message;

  DeleteModel({required this.message});

  factory DeleteModel.fromJson(Map<String, dynamic> json) {
    return DeleteModel(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}