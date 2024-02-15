import 'package:medicare_admin/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  Status? status;
  T? data;

  ApiResponse(this.message, this.data, this.status);
  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return 'Status:$status\nmessage:$message\ndata:$data';
  }
}
