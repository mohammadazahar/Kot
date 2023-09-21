import 'package:flutter/material.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/theme_helper.dart';

// ignore: must_be_immutable
class ChipviewgroupthItemWidget extends StatelessWidget {
  const ChipviewgroupthItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: getPadding(
        left: 10,
        right: 10,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "8-12 Hours",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      selectedColor: theme.colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: getHorizontalSize(
            1,
          ),
        ),
      ),
      onSelected: (value) {},
    );
  }
}
