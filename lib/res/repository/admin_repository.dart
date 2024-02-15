import 'package:medicare_admin/data/network/network_api_service.dart';
import 'package:medicare_admin/res/app_url/app_url.dart';

class AdminRepository {
  final _api = NetworkApiService();
  Future<dynamic> adminAuth(dynamic data) async {
    var result = await _api.postApi(
      AppUrl.adminLogin,
      data,
    );
    return result;
  }
}
