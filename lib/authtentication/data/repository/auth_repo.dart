import 'package:kot/constants_values.dart';
import 'package:kot/core/network/api_provider.dart';
import 'package:kot/authtentication/data/model/verify_phone.dart';

class AuthRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<PhoneLogin> sendOtp(String mobile, String countryCode) {
    return _apiProvider.sendOtp(
        mobile: mobile, countryCode: countryCode, type: ConstantsValues.login);
  }

  // Future<PhoneLogin> verifyMobile(String mobile, String otp, String rCode) {
  //   return _apiProvider.verifyMobile(mobile: mobile, otp: otp, rCode: rCode);
  // }
}
