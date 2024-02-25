import 'package:flutter/material.dart';
import 'package:hitchify/core/app_export.dart';
import 'package:hitchify/widgets/custom_icon_button.dart';

import '../custom_image_view.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 34.adaptSize,
          width: 34.adaptSize,
          child: CustomImageView(
            imagePath: ImageConstant.imgMegaphone,
          ),
        ),
      ),
    );
  }
}
