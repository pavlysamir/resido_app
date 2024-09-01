class LogoutModel {
  final List<String> data;

  LogoutModel({required this.data});

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      data: List<String>.from(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }
}