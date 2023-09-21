import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kot/custom_color.dart';
import 'package:kot/my_routes.dart';

class SearchWidget extends StatefulWidget {
  final Function? onTap;
  final String? initValue;
  final String? mowId;

  SearchWidget({
    this.initValue = "",
    this.onTap,
    this.mowId = "",
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(9),
              onTap: () => widget.onTap!(),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: CustomColor.colorWhite,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                        color: CustomColor.searchBarColor, width: 1)),
                child: InkWell(
                  onTap: widget.onTap as void Function()? ??
                      () {
                        Navigator.pushNamed(context, MyRouters.SEARCH,
                            arguments: widget.mowId);
                      },
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => widget.onTap!(),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 5.0, left: 8, top: 1),
                          child: Icon(
                            Icons.search,
                            color: CustomColor.colorBlack,
                            size: 22,
                          ),
                        ),
                      ),
                      widget.initValue != ""
                          ? Text(widget.initValue ?? "")
                          : Text("Search",
                              style: TextStyle(
                                  color: CustomColor.colorGreyLight,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            // StreamBuilder<bool>(
            //     stream: cameraTooltipBloc.toolTipVisibility.stream,
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData && snapshot.data == true) {
            //         return Align(
            //             alignment: Alignment.bottomRight,
            //             child: Padding(
            //               padding: EdgeInsets.only(top: 30, left: 20),
            //               child: Card(
            //                 elevation: 10,
            //                 shape: TooltipShape(),
            //                 child: Container(
            //                     padding: EdgeInsets.all(10),
            //                     child: Text(allTranslations
            //                         .text("Search using an image"))),
            //               ),
            //             ));
            //       }
            //       return SizedBox.shrink();
            //     })
          ],
        ),
      ],
    );
  }
}
