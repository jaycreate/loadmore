class ResultApiModel {
  final bool success;
  final String message;
  final int result;
  final dynamic data;

  ResultApiModel(
    this.success,
    this.message,
    this.result,
    this.data,
  );

  factory ResultApiModel.fromJson(Map<String, dynamic> json) {
    return ResultApiModel(
      json['success'] ?? false,
      json['message'] ?? 'unknown',
      json['result'] ?? 0,
      json['data'],
    );
  }
}
