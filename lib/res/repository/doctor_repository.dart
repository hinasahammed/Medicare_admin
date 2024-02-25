import 'package:medicare_admin/data/network/network_api_service.dart';
import 'package:medicare_admin/res/app_url/app_url.dart';

class DoctorRepository {
  final _api = NetworkApiService();
 
   Future<dynamic> doctorAuth(dynamic data) async {
    var result = await _api.postApi(
      AppUrl.doctorLogin,
      data,
    );
    return result;
  }
}
