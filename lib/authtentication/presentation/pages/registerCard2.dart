import 'package:flutter/material.dart';

class RegisterCard2 extends StatelessWidget {
  final kTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 32,
  );

  final Widget? bodyWidget;
  final Widget? buttonWidget;
  final double horizontalPadding;
  final double topPadding;
  final double bottomPadding;
  final double barHeight;
  final double buttonHeight;
  final ScrollController? scrollController;
  final bool isMobile;

  RegisterCard2(
      {this.bodyWidget,
      this.buttonWidget,
      this.scrollController,
      this.horizontalPadding = 25,
      this.topPadding = 75,
      this.bottomPadding = 15,
      this.buttonHeight = 45,
      this.barHeight = 35,
      this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 3 / 4 - barHeight,
              child: Stack(
                alignment: Alignment.topCenter,
                fit: StackFit.expand,
                children: [
                  Card(
                    margin: const EdgeInsets.fromLTRB(25, 70, 25, 0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    elevation: 6.0,
                    child: Container(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(
                              25, topPadding, 25, buttonHeight),
                          decoration: BoxDecoration(
                            color: Colors.grey[100]!.withOpacity(.9),
                          ),
                          child: bodyWidget),
                    ),
                  ),
                  Positioned(
                    bottom: bottomPadding,
                    child: buttonWidget!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
