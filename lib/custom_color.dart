import 'package:flutter/material.dart';

class CustomColor {
  static const colorPrimary =  Color(0xFF74B9FF);
  //static const colorPrimary =  Color(0xFF2F898F);
  static const colorPrimaryDark = Color(0xFF329696);
  //static const colorPrimaryDark = Color(0xFF2F898F);
  static const colorAccent = Color(0xFFF0AD4E);
  static const newPrimary =  Color(0xFF329696);
  static const widget = Color(0xFF292828);

  static const tourStartGradientColors = Color(0xFF329696); // Color(0xFF0E2F56);
  // static const tourStartGradientColors = Color(0xFF1C4D6E); // Color(0xFF0E2F56);
  static const tourEndGradientColors =  Color(0xFF329696);
  //static const tourEndGradientColors =  Color(0xFF339797);
  static const checkColor = Color(0xFF0E2F56);

  static const colorPrimaryLight =  Color(0xFF329696);
  //static const colorPrimaryLight =  Color(0xFF26BFA6);
  static const disableColor =  Color(0xFFC4C4C4);
  static const subCropSelection =  Color(0xD4329696);
  //static const subCropSelection =  Color(0xD43EB7BA);
  static const subCropSelectIconColor =  Color(0xFF0E2F56);


  static const holoGrey =  Color(0xff555555);
  static const lightGrey =  Color(0xff888888);
  static const lightGrey2 =  Color(0xFFE2E2E2);

  static const lineProgressBar =  Color(0xFFEBEBEB);
  static const tourColor =  Color(0xFF6C7B8A);

  static const searchBarColor =  Color(0xFFC9C9C9);
  static const activeDotColor =  Color(0xFF090F47);
  static const inActiveDotColor =  Color(0xFF090F47);
  static const productSelectColor =  Color(0xFF090F47);
  static const productItemWeightColor =  Color(0xFF444973);


  static const lightBackground =  Color(0xFFEDEDED);

  static const inactiveDotColor =  Color(0xFFDFF6F1);
  static const purpleColor =  Color(0xFF8184EE);

  static const mobileScreen = Color(0xFF8184EE);
  static const mobileScreenColor =  Color(0xFFC3C4EF);
  static const mobileScreenColor2 =  Color(0xFF4A4FEB);

  static const otpScreen = Color(0xFFF39F01);
  static const otpScreenColor =  Color(0xFFEEECD7);
  static const otpScreenColor2 =  Color(0xFFD33300);

  static const moreAbout = Color(0xFFEE4D47);
  static const moreAbout2 =  Color(0xFFFFAE64);

  static const otpReceive = Color(0xFF329696);
  // static const otpReceive = Color(0xFF339697);
  static const otpReceiveColors1 = Color(0xFFBBCECE);
  static const otpReceiveColors2 = Color(0xFF329696);
  //static const otpReceiveColors2 = Color(0xFF037677);
  static const referralCodeBackground = Color(0xFFDFDFDF);
  static const orderBorderColor = Color(0xFFE6E7Ed);
  static const myFramerSearchColor = Color(0xFF090F47);

  static const nameColor = Color(0xFFFF5E5E);
  static const nameColors1 = Color(0xFFE7C9C9);
  static const nameColors2 = Color(0xFFF11B1B);
  static const progressColor = Color(0xFFC10E08);

  static const cropCategory1 = Color(0xFFA2A4F5);
  static const cropCategory2 = Color(0xFF4A4FEB);

  static const linkColor = Color(0xFF2298DA);
  static const buttonStartGradient =  Color(0xFF77DB8F);
  static const buttonEndGradient =  Color(0xFF329696);
  // static const buttonEndGradient =  Color(0xFF319796);

  static const bgStartGradient =  Color(0xFFFFC3BD);
  static const bgEndGradient =  Color(0xFFFC7C64);

  static const colorGreyLight =  Color(0xFFAAAAAA);
  static const colorGreyLight_1 =  Color(0xFFB3B3B3);
  static const colorGreyHint =  Color(0xFFBBBBBB);
  static const colorGreySelect =  Color(0x40000000);
  static const colorDocumentUpload=Color(0xff848484);

  static const inactiveColorStart =  Color(0xFFB0B0B0);
  static const inactiveColorEnd =  Color(0xFFC8C8C8);

  static const backgroundColor =  Color(0xFFE5E5E5);
  static const greyColor = Color(0xFFADADAD);

  static const colorWhite =  Color(0xFFFFFFFF);
  static const colorBlack =  Color(0xFF000000);

  static const colorCartRemove =  Color(0xFFD1D1D1);
  static const colorCartAdd =  Color(0xFF808080);
  static const couponColor =  Color(0xFF27AE60);
  static const counterBackground =  Color(0xFFE0E0E0);

  static const borderButtonBG =  Color(0x99FFDE5E);
  static const pincodeBackColor=  Color(0xFF1C1C1C);

  static const colorTransparent =  Color(0x00000000);
  static const colorBtnGreen =  Color(0xff71b54c);
  static const colorBtnGreenLight =  Color(0xffa1d087);
  static const colorBtnYellow =  Color(0xfff79321);
  static const colorBtnYellowLight =  Color(0xffffb662);
  static const colorBtnRed =  Color(0xffff4141);
  static const colorBtnRedLight =  Color(0xffff9797);
  static const languageSelectedColor = Color(0xffEEFAF8);
  static const acceptButton = Color(0xff329696);
  // static const acceptButton = Color(0xff52A396);
  static const declineButton = Color(0xfff1f1f1);
  static const arrivedDateColor = Color(0xff379468);
  static const addressColor = Color(0xff383838);
  static const trackAddressColor = Color(0xffA7FA7A7);

  static const discountColor=Color(0xff4CC800);
  static const ledgerCardColor= Color(0xffE8F4F2);
  static const ledgerTextColor= Color(0xffA9A9A9);

  static const prodDetailCouponColor= Color(0xff329696);
  // static const prodDetailCouponColor= Color(0xff006868);

  static const previousStageColor =  Color(0xFFCEE3A3);
  static const ongoingStageColor = Color(0xFFBCE3E3);
  static const upcomingStageColor = Color(0xFFE3C69F);

  static const addressLebelBackground = Color(0xFFEEF5F5);

  static const nameTextColor = Color(0xFF1A4E70);

  static const packageSizeBorder=Color(0xFF006868);

  static Color convertColor(String color) {
    color = color.trim().replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF"+color));
    } else if (color.length == 8) {
      return Color(int.parse("0x"+color));
    }else{
      return Colors.white12;
    }
  }

  static const  Map<int, Color> color = {
    50: Color.fromRGBO(72, 0, 30, .1),
    100: Color.fromRGBO(72, 0, 30, .2),
    200: Color.fromRGBO(72, 0, 30, .3),
    300: Color.fromRGBO(72, 0, 30, .4),
    400: Color.fromRGBO(72, 0, 30, .5),
    500: Color.fromRGBO(72, 0, 30, .6),
    600: Color.fromRGBO(72, 0, 30, .7),
    700: Color.fromRGBO(72, 0, 30, .8),
    800: Color.fromRGBO(72, 0, 30, .9),
    900: Color.fromRGBO(72, 0, 30, 1),
  };
  static const  MaterialColor colorCustom = MaterialColor(0xFF48001E, color);


}