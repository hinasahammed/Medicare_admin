import 'package:medicare_admin/data/network/network_api_service.dart';
import 'package:medicare_admin/res/app_url/app_url.dart';

class DoctorRepository {
  final _api = NetworkApiService();
  Future<dynamic> getAllDoctorData() async {
    var result = await _api.getApi(
      AppUrl.getdoctor,
    );
    return result;
  }
  Future<dynamic> changeDoctorAvailability(dynamic data) async {
    var result = await _api.postApi(
      AppUrl.updateAvailability,
      data,
    );
    return result;
  }
  Future<dynamic> addDoctor(dynamic data) async {
    var result = await _api.postApi(
      AppUrl.addDoctor,
      data,
    );
    return result;
  }
  Future<dynamic> deleteDoctor(String doctorName) async {
    var result = await _api.deleteApi(
      'http://192.168.0.104:3000/doctors/$doctorName',
    );
    return result;
  }
}
