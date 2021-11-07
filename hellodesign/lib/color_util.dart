import 'dart:math';
import 'dart:ui';

/// 颜色工具类
class ColorUtil {
  /// 计算对比度
  static num calcColorContrastRatio(Color color1, Color color2) {
    // 计算亮度
    num lum1 = luminance(color1);
    num lum2 = luminance(color2);

    // 稍亮的颜色
    num lumLighter = max(lum1, lum2);
    // 稍暗的颜色
    num lumDarker = min(lum1, lum2);

    // 对比度
    num ratio = (lumLighter + 0.05) / (lumDarker + 0.05);
    return ratio;
  }

  /// 计算相对光线亮度
  /// 公式： https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-procedure
  static num luminance(Color c) {
    List<num> rgb = [c.red, c.green, c.blue];

    List<num> lum = rgb
        .map((v) => () {
              num vs = v / 255;
              return (vs <= 0.03928)
                  ? vs / 12.92
                  : pow(((vs + 0.055) / 1.055), 2.4);
            }())
        .toList();

    return lum[0] * 0.2126 + lum[1] * 0.7152 + lum[2] * 0.0722;
  }

  /// 计算对比度
  static num calcContrastRatio(String color1, String color2) {
    Color c1 = toColor(color1);
    Color c2 = toColor(color2);
    return calcColorContrastRatio(c1, c2);
  }

  /// 颜色字符串 转换成颜色
  ///  sColor 颜色字符串 例：'0x000000'  '0xff000000' '#000000' '#000000'
  ///  参考：https://www.jianshu.com/p/341171bfcdc7
  static Color toColor(String sColor) {
    // 未带0xff前缀并且长度为6
    if (!sColor.startsWith('0xff') && sColor.length == 6) {
      sColor = '0xff' + sColor;
    }

    // 8位，如0x000000
    if (sColor.startsWith('0x') && sColor.length == 8) {
      sColor = sColor.replaceRange(0, 2, '0xff');
    }

    // 7位，如#000000
    if (sColor.startsWith('#') && sColor.length == 7) {
      sColor = sColor.replaceRange(0, 1, '0xff');
    }

    // 转成 Color
    return Color(int.parse(sColor));
  }
}
