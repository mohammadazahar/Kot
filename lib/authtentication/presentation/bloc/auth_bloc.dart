import 'dart:async';

import 'package:kot/authtentication/data/model/verify_otp.dart';
import 'package:kot/authtentication/data/model/verify_phone.dart';
import 'package:kot/authtentication/data/repository/auth_repo.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  AuthRepository _authRepository = AuthRepository();
  final BehaviorSubject<int> _timeData = BehaviorSubject<int>();
  Timer? _timer;
  int _start = 120;

  _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
        } else {
          _start--;
        }
        _timeData.sink.add(_start);
      },
    );
  }

  _setTimerZero() {
    _timeData.sink.add(0);
  }

  _setTimeToMax() {
    _start = 120;
  }

  _cancelTimer() {
    _timer!.cancel();
  }

  Future<String> _sendOtp(String mobile, String countryCode) async {
    String status = "";
    PhoneLogin response = await _authRepository.sendOtp(mobile, countryCode);
    if (response.message == "Success") {
      status = response.message!;
    } else if (response.message == 24) {
      status = "maxLimit";
    } else {
      status = response.error ?? "";
    }
    return status;
  }

  //method to verify number at playStore

  dispose() {
    _timer!.cancel();
    _timeData.close();
  }

  BehaviorSubject<int> get timerData => _timeData;

  setTimeToMax() => _setTimeToMax();

  startTimer() => _startTimer();

  setTimeToZero() => _setTimerZero();

  cancelTimer() => _cancelTimer();

  Future<String> sendOtp(String mobile, String countryCode) =>
      _sendOtp(mobile, countryCode);
}

final authBloc = AuthBloc();
