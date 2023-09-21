import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kot/custom_color.dart';

class PopupHelper {
  static PopupHelper _instance = new PopupHelper.internal();
  Timer? _timer;
  Dialog? _dialog;
  PopupHelper.internal();
  bool isShowing = false;

  factory PopupHelper() => _instance;

  void showCustomDialog(BuildContext context,
      {required String? message,
      required String image,
      int dismissTime = 0,
      Function? onDismissDialog}) {
    showDialog(
      context: context,
      builder: (_) {
        if (dismissTime > 0) {
          int _start = dismissTime;
          const oneSec = Duration(seconds: 1);
          _timer = Timer.periodic(oneSec, (Timer timer) {
            if (_start == 0) {
              timer.cancel();
              Navigator.pop(context);
            } else {
              _start--;
            }
          });
        }
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                SvgPicture.asset(image),
                SizedBox(
                  height: 40,
                ),
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      _timer?.cancel();
      if (onDismissDialog != null) onDismissDialog();
    });
  }

  void showCustomChildDialog(BuildContext context,
      {required Widget message,
      required String image,
      int dismissTime = 0,
      Function? onDismissDialog}) {
    showDialog(
      context: context,
      builder: (_) {
        if (dismissTime > 0) {
          int _start = dismissTime;
          const oneSec = const Duration(seconds: 1);
          _timer = new Timer.periodic(oneSec, (Timer timer) {
            if (_start == 0) {
              timer.cancel();
              Navigator.pop(context);
            } else {
              _start--;
            }
          });
        }
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                SvgPicture.asset(image),
                SizedBox(
                  height: 40,
                ),
                message,
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
    ).then((value) {
      _timer?.cancel();
      if (onDismissDialog != null) onDismissDialog();
    });
  }

  showLoaderDialog(BuildContext loaderContext) {
    isShowing = true;
    if (_dialog == null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _dialog = Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // insetPadding: EdgeInsets.symmetric(horizontal: 120),
          child: Container(
            padding: EdgeInsets.all(16),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpinKitHourGlass(
                  color: CustomColor.colorPrimary,
                ),
              ],
            ),
          ),
        );
        if (_dialog != null)
          showDialog(
            barrierDismissible: false,
            context: loaderContext,
            builder: (BuildContext buildContext) {
              return SizedBox(
                width: 50,
                height: 50,
                child: WillPopScope(
                  onWillPop: () {
                    return Future.value(false);
                  },
                  child: _dialog!,
                ),
              );
            },
          ).then((value) => _dialog == null);
      });
    }
  }

  Future hideLoaderDialog(BuildContext context) async {
    if (_dialog != null) {
      Navigator.of(context, rootNavigator: true).pop();
      _dialog = null;
      isShowing = true;
    }
  }

  showLocationDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor:
              MaterialStateProperty.all<Color>(CustomColor.acceptButton)),
      child: Text(("Cancel")),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor:
              MaterialStateProperty.all<Color>(CustomColor.acceptButton)),
      child: Text("Open Setting"),
      onPressed: () {
        AppSettings.openLocationSettings();
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(""),
      content: Text(
        "For better experience please turn on device GPS",
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showCustomPinCodeDialog(BuildContext context, Function onDismissDialog) {
    var text = TextEditingController();
    final formkey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          content: Container(
            decoration: BoxDecoration(
              color: CustomColor.pincodeBackColor.withOpacity(.82),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 13, top: 14),
                      child: Text(
                        "Enter pincode",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 13, right: 13, top: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length != 6) {
                          return ("Invalid Pincode");
                        }
                        return null;
                      },
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      controller: text,
                      maxLength: 6,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        // labelText: 'Enter pincode',
                        hintText: ("Enter 6 digit pincode here"),
                        counterText: "",
                        counter: null,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: CustomColor.disableColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    child: Center(
                      child: Container(
                        width: 134,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  CustomColor.acceptButton)),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              onDismissDialog(text.text);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            ("APPLY"),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Future<void> showLogoutConfirmation(BuildContext context) async {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       content: Text(
  //         "All your offline data will be erased, are you sure you want to logout from KOT?",
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //       actions: <Widget>[
  //         InkWell(
  //           onTap: () {
  //             Navigator.pop(context);
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               ("Cancel").toUpperCase(),
  //               style: TextStyle(
  //                   color: CustomColor.colorPrimary,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         InkWell(
  //           onTap: () async {
  //             await SharedPreferencesHelper.logoutData();
  //             Navigator.pushNamedAndRemoveUntil(
  //                 context, MyRouters.START, (Route<dynamic> route) => false);
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               ("SIGN OUT"),
  //               style: TextStyle(
  //                   color: Colors.redAccent, fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 5,
  //         ),
  //       ],
  //     ),
  //   );
  // }

}
