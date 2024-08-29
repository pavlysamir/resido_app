class DeleteModel {
  final List<String> data;

  DeleteModel({required this.data});

  factory DeleteModel.fromJson(Map<String, dynamic> json) {
    return DeleteModel(
      data: List<String>.from(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }
}