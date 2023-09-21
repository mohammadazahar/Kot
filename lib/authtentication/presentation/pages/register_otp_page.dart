import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:kot/constants_values.dart';
import 'package:kot/core/network/api_provider.dart';
import 'package:kot/authtentication/data/model/verify_otp.dart';
import 'package:kot/authtentication/presentation/bloc/auth_bloc.dart';
import 'package:kot/authtentication/presentation/pages/registerCard2.dart';
import 'package:kot/core/network/popupHelper.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/sharedPreferencesHelper.dart';
import 'package:kot/toastHelper.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../../data/model/register_otp_params_model.dart';
import '../../data/model/verify_phone.dart';
import '../widgets/custom_buttons.dart';

enum Status { WAITING, RESEND, VALIDATE, LATER, AGAIN }

extension StatusExtension on Status {
  String get displayTitle {
    switch (this) {
      case Status.WAITING:
        return "WAITING FOR OTP ...";
      case Status.RESEND:
        return "RESEND";
      case Status.VALIDATE:
        return "VALIDATE OTP";
      case Status.LATER:
        return "TRY LATER";
      case Status.AGAIN:
        return "TRY AGAIN";
      default:
        return "WAITING FOR OTP ...";
    }
  }
}

class RegisterOtpPage extends StatefulWidget {
  final RegisterOtpParams params;
  RegisterOtpPage(this.params);

  @override
  State<RegisterOtpPage> createState() => _RegisterOtpPageState();
}

class _RegisterOtpPageState extends State<RegisterOtpPage>
    with WidgetsBindingObserver {
  final kTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 32,
  );
  String _circleImage = "otp_screen.png";
  Timer? _timer;
  int _start = 30;
  String _currentCode = "123456";
  String? appSignature;
  // CustomSmsAutoFill _smsAutoFill = CustomSmsAutoFill();
  SmsAutoFill _smsAutoFill = SmsAutoFill();
  bool isInit = true;
  bool isIncorrect = false;
  bool isLimit = false;
  String _cardBg = "intro_bg.png";
  bool isExpired = false;
  FocusNode _focusNode = FocusNode();
  String? code = '';
  ScrollController _scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  bool _isResume = false;

  @override
  void initState() {
    super.initState();
    MyRouters.getCurrentScreenInformation(MyRouters.REGISTER_OTP);
    WidgetsBinding.instance.addObserver(this);

    _startTimer();
    // listenForCode();
    // _smsAutoFill.getAppSignature.then((signature) {
    //   print(signature);
    //   setState(() {
    //     appSignature = signature;
    //   });
    // });

    if (mounted) _requestOtpNew(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _isResume = true;
    } else if (state == AppLifecycleState.resumed && _isResume) {}
  }

  listenForCode() async {
    await _smsAutoFill.listenForCode;
  }

  _requestOtpNew(BuildContext context) async {
    PopupHelper().showLoaderDialog(context);
    ApiProvider()
        .sendOtp(mobile: widget.params.mobile, countryCode: "91", type: "login")
        .then((value) {
      PopupHelper().hideLoaderDialog(context);
      // if (value.message == "Success") {

      _currentCode = "123456";
      // setState(() {}
      // );

      ToastHelper.showToast("OTP received");
      // }
    }).catchError((onError) {
      PopupHelper().hideLoaderDialog(context);
      print(onError);
    });
  }

  verifyMobileAPICall(String? mobile) async {
    print(mobile);
    ApiProvider().verifyMobile(mobile).then((value) async {
      print(value);
      String? message = phoneLoginFromJson(value).message;
      int? status = 200;
      // getDeviceDetails();
      Navigator.pushNamed(
        context,
        MyRouters.NAV,
      );
      if (status == 200) {
        await SharedPreferencesHelper.setIsLogin(true);
      } else if (status == 7006) {
        ToastHelper.showToast(message!);
        PopupHelper().hideLoaderDialog(context);
        Navigator.pushNamedAndRemoveUntil(
            context, MyRouters.SPLASH, (Route<dynamic> route) => false);
      } else {
        PopupHelper().hideLoaderDialog(context);
        ToastHelper.showToast("This mobile number is not registered with us");
      }
    }).catchError((e) {
      print(e);
      if (mounted) PopupHelper().hideLoaderDialog(context);
    });
  }

  verifyEmailAPICall(String? mobile) async {
    print(mobile);
    ApiProvider().verifyMobile(mobile).then((value) async {
      print(value);
      String? message = phoneLoginFromJson(value).message;
      int? status = 200;
      // getDeviceDetails();
      Navigator.pushNamed(
        context,
        MyRouters.NAV,
      );
      if (status == 200) {
        await SharedPreferencesHelper.setIsLogin(true);
      } else if (status == 7006) {
        ToastHelper.showToast(message!);
        PopupHelper().hideLoaderDialog(context);
        Navigator.pushNamedAndRemoveUntil(
            context, MyRouters.SPLASH, (Route<dynamic> route) => false);
      } else {
        PopupHelper().hideLoaderDialog(context);
        ToastHelper.showToast("This mobile number is not registered with us");
      }
    }).catchError((e) {
      print(e);
      if (mounted) PopupHelper().hideLoaderDialog(context);
    });
  }

  _verifyOtpNew() async {
    PopupHelper().showLoaderDialog(context);
    ApiProvider()
        .verifyOtp(
            mobile: widget.params.mobile,
            countryCode: widget.params.countryCode,
            otp: _currentCode,
            type: "login")
        .then((value) {
      if (value.message == "OTP verified") {
        // verifyMobileAPICall(widget.params.mobile);
        Navigator.pushNamedAndRemoveUntil(
            context, MyRouters.NAV, (route) => false);
      }
    }).catchError((onError) {
      PopupHelper().hideLoaderDialog(context);
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 50), () {
        try {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        } catch (e) {
          print(e.toString());
        }
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //  extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: SvgPicture.asset(
            'assets/app_background.svg',
            fit: BoxFit.fill,
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          title: const Text(
            "Welcome",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.white,
        ),
        body: isInit ? _init() : _errorCard(),
      ),
    );
  }

  _init() {
    return RegisterCard2(
      bodyWidget: _bodyWidget(),
      buttonWidget: _initButton(context),
      scrollController: _scrollController,
      barHeight: MediaQuery.of(context).padding.top, // icon size 90X90
      bottomPadding: 10,
      buttonHeight: 50,
      topPadding: 55,
    );
  }

  _errorCard() {
    return RegisterCard2(
      bodyWidget: getErrorBodyCard(),
      buttonWidget: getErrorButton(),
      scrollController: _scrollController,
      barHeight: MediaQuery.of(context).padding.top,
      bottomPadding: 5,
      buttonHeight: 55,
      topPadding: 55,
    );
  }

  getErrorBodyCard() {
    if (isIncorrect) return _incorrectOtpWidget();
    if (isExpired) return _expiredWidget();
    return _maxLimitWidget();
  }

  getErrorButton() {
    if (isIncorrect) return _inCorrectOtpButton();
    if (isExpired) return _expiredOtpButton();
    return _maxLimitButton();
  }

  _expiredOtpButton() {
    return BorderButton(
      width: MediaQuery.of(context).size.width - 100,
      height: 40,
      borderRadius: 12,
      backgroundColor: CustomColor.moreAbout,
      borderColor: CustomColor.moreAbout,
      onPressed: () {
        // setState(() {
        //   _currentCode = "";
        //   _start = 0;
        //   _timer!.cancel();
        //   isInit = true;
        //   _circleImage = "otp_screen.png";
        //   isIncorrect = false;
        //   isLimit = false;
        // });
        _startTimer();
        _requestOtpNew(context);
      },
      title: Text(
        StatusExtension(Status.RESEND).displayTitle,
        style: kTextStyle.copyWith(fontSize: 18, color: CustomColor.colorWhite),
      ),
    );
  }

  SingleChildScrollView _expiredWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Validation Failed",
            style: kTextStyle.copyWith(
                color: CustomColor.moreAbout,
                fontWeight: FontWeight.normal,
                fontSize: 24),
          ),
          Text(
            "OTP expired.",
            style: kTextStyle.copyWith(
                fontSize: 20, color: CustomColor.colorBlack),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Uh oh! The OTP you entered seems to be expired. Try again.",
            style: kTextStyle.copyWith(
              color: CustomColor.colorBlack,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Column _bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Validating OTP",
          style: kTextStyle.copyWith(
              color: CustomColor.colorBlack,
              fontWeight: FontWeight.normal,
              fontSize: 24),
        ),
        Text(
          "check your mobile",
          style: kTextStyle.copyWith(
            color: CustomColor.colorBlack,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: kTextStyle.copyWith(
                fontWeight: FontWeight.normal,
                color: CustomColor.colorBlack,
                fontSize: 16,
                fontFamily: "Poppins"),
            children: <TextSpan>[
              TextSpan(
                text: !isIncorrect
                    ? "We have sent an OTP to the your mobile number" +
                        "${widget.params.mobile} "
                    : "Please enter the correct OTP that has already been sent to" +
                        " ${widget.params.mobile}. ",
              ),
              TextSpan(
                text: 'change',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
                style: kTextStyle.copyWith(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "Poppins",
                  color: CustomColor.colorBlack,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinFieldAutoFill(
                  currentCode: _currentCode,
                  onCodeSubmitted: (code) {
                    _currentCode = code;
                  },
                  focusNode: _focusNode,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onCodeChanged: (code) {
                    _currentCode = code ?? "";
                    // if (code?.length == 6) {
                    //   setState(() {
                    //     _circleImage = "validate_otp_image.png";
                    //     _verifyOtpNew();
                    //     // verifyMobileAPICall(widget.mobileNumber, _currentCode);
                    //   });
                    // }
                  },
                  decoration: BoxLooseDecoration(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    strokeColorBuilder: FixedColorBuilder(Colors.grey[300]!),
                    bgColorBuilder:
                        const FixedColorBuilder(CustomColor.colorWhite),
                  ),
                  codeLength: 6,
                ),
                Visibility(
                  visible: _start > 0 && _currentCode!.length < 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Resend request available in " + _start.toString() + "s",
                      style: kTextStyle.copyWith(
                          color: CustomColor.colorBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _initButton(BuildContext context) {
    return Visibility(
      visible: _currentCode.length < 6,
      child: _start > 0
          ? BorderButton(
              width: MediaQuery.of(context).size.width - 100,
              height: 43,
              borderRadius: 12,
              backgroundColor: CustomColor.disableColor,
              borderColor: CustomColor.disableColor,
              onPressed: () {
                //No action required in this scenario
              },
              title: Text(
                StatusExtension(Status.WAITING).displayTitle,
                textScaleFactor: 0.9,
                style: kTextStyle.copyWith(
                    fontSize: 18,
                    color: CustomColor.colorWhite.withOpacity(0.3)),
              ),
            )
          : BorderButton(
              width: MediaQuery.of(context).size.width - 100,
              height: 43,
              borderRadius: 12,
              backgroundColor: CustomColor.colorPrimary,
              // backgroundColor: Color(0xff54a494),
              borderColor: CustomColor.colorPrimary,
              //  borderColor: Color(0xff54a494),
              onPressed: () {
                setState(() {
                  _start = 30;
                  _startTimer();
                  //Call send OTP method
                  _requestOtpNew(context);
                });
              },
              title: Text(
                StatusExtension(Status.RESEND).displayTitle,
                style: kTextStyle.copyWith(
                    fontSize: 18, color: CustomColor.colorWhite),
              ),
            ),
      replacement: BorderButton(
        width: MediaQuery.of(context).size.width - 100,
        height: 43,
        borderRadius: 12,
        backgroundColor: CustomColor.colorPrimary,
        //   backgroundColor: Color(0xff54a494),
        borderColor: CustomColor.colorPrimary,
        //  borderColor: Color(0xff54a494),
        onPressed: () async {
          _verifyOtpNew();
          Navigator.pushNamed(
            context,
            MyRouters.THANKYOU,
          );

          // Future.delayed(const Duration(seconds: 3));
          //verifyMobileAPICall(widget.mobileNumber, _currentCode);
        },
        title: Text(
          StatusExtension(Status.VALIDATE).displayTitle,
          style:
              kTextStyle.copyWith(fontSize: 18, color: CustomColor.colorWhite),
        ),
      ),
    );
  }

  SingleChildScrollView _incorrectOtpWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Validation Failed",
            style: kTextStyle.copyWith(
                color: CustomColor.colorBlack,
                fontWeight: FontWeight.normal,
                fontSize: 24),
          ),
          Text(
            "Incorrect OTP received",
            style: kTextStyle.copyWith(
              color: CustomColor.colorBlack,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Uh oh! The OTP you entered seems to be incorrect. Try again.",
            style: kTextStyle.copyWith(
              color: CustomColor.colorBlack,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _maxLimitWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Validation Failed',
            style: kTextStyle.copyWith(
                color: CustomColor.colorBlack,
                fontWeight: FontWeight.normal,
                fontSize: 24),
          ),
          Text(
            'Maximum retries reached.',
            style: kTextStyle.copyWith(
              color: CustomColor.colorBlack,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "You have reached the maximum number of OTP authentication retries (5) possible in a single day.",
            style: kTextStyle.copyWith(
              fontWeight: FontWeight.normal,
              color: CustomColor.colorBlack,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: kTextStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: CustomColor.colorBlack,
                  fontFamily: "Poppins"),
              children: <TextSpan>[
                const TextSpan(
                    text:
                        "Please try again tomorrow. If you continue facing this issue, contact us at "),
                TextSpan(
                  text: " support@kisanwala.com",
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: CustomColor.colorBlack,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _inCorrectOtpButton() {
    return BorderButton(
      width: MediaQuery.of(context).size.width - 100,
      height: 43,
      borderRadius: 12,
      backgroundColor: CustomColor.moreAbout,
      borderColor: CustomColor.moreAbout,
      onPressed: () {
        setState(() {
          _currentCode = "";
          _start = 0;
          _timer!.cancel();
          isInit = true;
          _circleImage = "otp_screen.png";
          _cardBg = "intro_bg.png";
          isLimit = false;
        });
        _startTimer();
      },
      title: Text(
        StatusExtension(Status.AGAIN).displayTitle,
        style: kTextStyle.copyWith(fontSize: 18, color: CustomColor.colorWhite),
      ),
    );
  }

  _maxLimitButton() {
    return BorderButton(
      width: MediaQuery.of(context).size.width - 100,
      height: 43,
      borderRadius: 15,
      backgroundColor: CustomColor.moreAbout,
      borderColor: CustomColor.moreAbout,
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, MyRouters.REGISTER, (Route<dynamic> route) => false);
      },
      title: Text(
        StatusExtension(Status.LATER).displayTitle,
        style: kTextStyle.copyWith(fontSize: 18, color: CustomColor.colorWhite),
      ),
    );
  }

  _startTimer() {
    if (_timer != null) _timer!.cancel();
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    // _auth.signOut();
    WidgetsBinding.instance.removeObserver(this);
    _smsAutoFill.unregisterListener();
    super.dispose();
  }
}
