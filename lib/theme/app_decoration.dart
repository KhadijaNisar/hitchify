import 'package:flutter/material.dart';
import 'package:hitchify/theme/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray100,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray90001,
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: appTheme.gray200,
      );
  static BoxDecoration get fillGray20001 => BoxDecoration(
        color: appTheme.gray20001,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal500,
      );
  static BoxDecoration get fillTeal50 => BoxDecoration(
        color: appTheme.teal50,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow700,
      );

  // Outline decorations
  static BoxDecoration get outlineTeal => BoxDecoration(
        color: appTheme.teal100,
        border: Border.all(
          color: appTheme.teal500,
          width: 1,
        ),
      );
  static BoxDecoration get outlineTeal100 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.teal100,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.24),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineTeal200 => BoxDecoration(
        color: appTheme.teal50,
        border: Border.all(
          color: appTheme.teal200,
          width: 1,
        ),
      );
  static BoxDecoration get outlineTeal500 => BoxDecoration(
        color: appTheme.teal50,
        border: Border.all(
          color: appTheme.teal500,
          width: 1,
        ),
      );
  static BoxDecoration get outlineTeal5001 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.teal500,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.24),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder112 => BorderRadius.circular(
        112,
      );
  static BorderRadius get circleBorder18 => BorderRadius.circular(
        18,
      );
  static BorderRadius get circleBorder36 => BorderRadius.circular(
        36,
      );
  static BorderRadius get circleBorder69 => BorderRadius.circular(
        69,
      );
  static BorderRadius get circleBorder77 => BorderRadius.circular(
        77,
      );

  // Custom borders
  static BorderRadius get customBorderBL16 => BorderRadius.only(
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      );
  static BorderRadius get customBorderBL30 => BorderRadius.vertical(
        bottom: Radius.circular(30),
      );
  static BorderRadius get customBorderTL24 => BorderRadius.vertical(
        top: Radius.circular(24),
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1,
      );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12,
      );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4,
      );
  static BorderRadius get roundedBorder60 => BorderRadius.circular(
        60,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
