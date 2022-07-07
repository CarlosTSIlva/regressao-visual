import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart' as toolkit;

class Devices {
  /// [iphone11] matches specs of iphone SE, but with lower DPI for performance.
  static toolkit.Device get iphoneSE => const toolkit.Device(
        size: Size(320.0, 568.0),
        name: 'iphone_se__text_scale_1_0',
        safeArea: EdgeInsets.only(top: 20.0),
      );
  static toolkit.Device iphoneSEWithTextScale(double textScale) =>
      iphoneSE.copyWith(
        name: 'iphone_se__text_scale_${textScale.title()}',
        textScale: textScale,
      );

  /// [iphone11] matches specs of iphone 11, but with lower DPI for performance.
  static toolkit.Device get iphone11 => const toolkit.Device(
        size: Size(414.0, 896.0),
        name: 'iphone_11__text_scale_1_0',
        safeArea: EdgeInsets.only(top: 48.0, bottom: 34.0),
      );
  static toolkit.Device iphone11WithTextScale(double textScale) =>
      iphone11.copyWith(
        name: 'iphone_11__text_scale_${textScale.title()}',
        textScale: textScale,
      );
}

final devicesWithDifferentTextScales = [
  Devices.iphoneSE,
  Devices.iphone11,
  Devices.iphoneSEWithTextScale(1.3),
  Devices.iphone11WithTextScale(1.3),
  Devices.iphoneSEWithTextScale(1.6),
  Devices.iphone11WithTextScale(1.6),
];

extension DoubleExtensions on double {
  String title() {
    return toString().replaceFirst('.', '_');
  }
}
