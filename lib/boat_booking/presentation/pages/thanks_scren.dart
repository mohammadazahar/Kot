import 'package:flutter/material.dart';
import 'package:kot/core/app_export.dart';
import 'package:kot/my_routes.dart';
import 'package:kot/widgets/custom_elevated_button.dart';

import '../widgets/common_bottom.dart';

class ThanksScreen extends StatelessWidget {
  ThanksScreen({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 19,
            bottom: 19,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  left: 20,
                  top: 27,
                ),
                child: Text(
                  "Thank you!",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.headlineSmallPoppinsOnPrimary,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  289,
                ),
                margin: getMargin(
                  left: 20,
                  top: 15,
                  right: 65,
                ),
                child: Text(
                  "Thank you for registering with Us\nPlease complete your registration and be\nactivated by visiting our office.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.bodyMediumPoppinsGray800,
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: getMargin(
                  top: 44,
                ),
                padding: getPadding(
                  left: 4,
                  top: 36,
                  right: 4,
                  bottom: 36,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      ImageConstant.imgGroup13,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgUndrawchecking,
                  height: getVerticalSize(
                    187,
                  ),
                  width: getHorizontalSize(
                    241,
                  ),
                  margin: getMargin(
                    top: 42,
                  ),
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                onTap: (){
                  Navigator.pushNamed(context, MyRouters.openOrderScreen);
                },
                text: "Go to Booking History",
                margin: getMargin(
                  left: 20,
                  right: 21,
                ),
                rightIcon: Container(
                  margin: getMargin(
                    left: 30,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowright,
                  ),
                ),
                buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(Size(
                      double.maxFinite,
                      getVerticalSize(
                        55,
                      ),
                    ))),
                buttonTextStyle: CustomTextStyles.titleSmallPoppinsGray50,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
       // bottomNavigationBar: CommonBottom(selectedIndex: 3),
      ),
    );
  }

  ///Handling route based on bottom click actions

}
