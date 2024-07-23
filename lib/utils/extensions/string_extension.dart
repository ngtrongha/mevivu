import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? enumToString(dynamic e) {
  if (e == null) {
    return null;
  }
  return e.toString().split('.').last;
}

extension DoubleExtension on num {
  String get removeTrailingZero =>
      toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
}

extension IntegerExtensions on int? {
  String toVietnameseWords() {
    if (this == null) {
      return '';
    }
    if (this == 0) {
      return 'Không';
    }

    if (this! < 0) {
      return 'Âm ${(-this!).toVietnameseWords().toLowerCase()}';
    }

    String s = toString();

    List<String> groups =
        (ZERO_LEFT_PADDING[s.length % 3] + s).chunk(3).toList();
    bool showZeroHundred = shouldShowZeroHundred(groups);

    int index = -1;
    String rawResult = groups.fold('', (String acc, String e) {
      index++;
      String triple = readTriple(e, showZeroHundred && index > 0);
      String multipleThousand = triple.trim().isEmpty
          ? ''
          : MULTIPLE_THOUSAND[groups.length - 1 - index];
      return '$acc $triple $multipleThousand';
    });

    return RegExp(r'\s+').allMatches(rawResult).isEmpty
        ? rawResult.trim().capitalize()
        : rawResult.replaceAll(RegExp(r'\s+'), ' ').trim().capitalize();
  }
}

extension StringsExtension on String {
  Iterable<String> chunk(int chunkSize) sync* {
    for (int i = 0; i < length; i += chunkSize) {
      yield substring(i, min(i + chunkSize, length));
    }
  }

  String get pathName => '/$this';
  String capitalize() {
    if (isEmpty) {
      throw 'Input cannot be empty';
    } else {
      return substring(0, 1).toUpperCase() + substring(1).toLowerCase();
    }
  }

  bool get emailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  String noAccentVietnamese([final bool? enable]) {
    String result = this;
    if (enable == null || !enable) {
      result = result.replaceAll(RegExp('[áàảãạăắằẳẵặâấầẩẫậ]'), 'a');
      result = result.replaceAll(RegExp('[ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ]'), 'A');
      result = result.replaceAll(RegExp('[éèẻẽẹêếềểễệ]'), 'e');
      result = result.replaceAll(RegExp('[ÉÈẺẼẸÊẾỀỂỄỆ]'), 'E');
      result = result.replaceAll(RegExp('[óòỏõọôốồổỗộơớờởỡợ]'), 'o');
      result = result.replaceAll(RegExp('[ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ]'), 'O');
      result = result.replaceAll(RegExp('[íìỉĩị]'), 'i');
      result = result.replaceAll(RegExp('[ÍÌỈĨỊ]'), 'I');
      result = result.replaceAll(RegExp('[úùủũụưứừửữự]'), 'u');
      result = result.replaceAll(RegExp('[ÚÙỦŨỤƯỨỪỬỮỰ]'), 'U');
      result = result.replaceAll(RegExp('[ýỳỷỹỵ]'), 'y');
      result = result.replaceAll(RegExp('[ÝỲỶỸỴ]'), 'Y');
      result = result.replaceAll(RegExp('đ'), 'd');
      result = result.replaceAll(RegExp('Đ'), 'D');
    }
    return result;
  }

  T? toEnum<T>(List<T> list) {
    try {
      final T item = list.firstWhere(
        (T e) {
          final String t = e.toString().split('.').last;
          return t == this;
        },
      );
      return item;
    } catch (_) {}
    return null;
  }

  String pageParams([Map<String, dynamic> params = const {}]) {
    var router = this;
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        if (key == params.keys.first) {
          router = '$router?$key=$value';
        } else {
          router = '$router&$key=$value';
        }
      });
    }
    return router;
  }
}

extension Color2StringExtension on Color {
  String get toHexTriplet =>
      (value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
}

extension SVGExtension on String {
  String get svg => 'assets/svg/$this.svg';
  String get riv => 'assets/rive/$this.riv';
  String get lottie => 'assets/lottie/$this.json';
  String get png => 'assets/image/$this.png';
  String get jpg => 'assets/jpg/$this.jpg';
  String get gif => 'assets/gif/$this.gif';
}

extension ColorExtension on String {
  Color get toColor => isEmpty
      ? Color(int.parse('0xFF34499D'))
      : Color(substring(0, 1) != '#'
          ? int.parse('0xFF$this')
          : int.parse(replaceAll('#', '0xFF')));
}

extension FontSizeExtension on String? {
  Text get size32 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 32,
          color: '151515'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size30 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 30,
          color: '151515'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size28 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 28,
          color: '151515'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size26 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 26,
          color: '151515'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size24 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 24,
          color: '151515'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size22 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 22,
          color: '151515'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size20 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 20,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size18 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 18,
          color: '151515'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size17 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 17,
          color: '858585'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size16 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 16,
          color: '858585'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size15 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 15,
          color: '858585'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size14 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 14,
          color: '858585'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size13 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 13,
          color: '858585'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size12 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 12,
          color: '858585'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size11 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 11,
          color: '858585'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
  Text get size10 => Text(
        this ?? '',
        style: TextStyle(
          fontSize: 10,
          color: '858585'.toColor,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      );
}

extension FontWeightExtension on Text {
  Text get w100 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w100),
      );
  Text get w200 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w200),
      );
  Text get w300 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w300),
      );
  Text get w400 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w400),
      );
  Text get w500 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w500),
      );
  Text get w600 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w600),
      );
  Text get w700 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w700),
      );
  Text get w800 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w800),
      );
  Text get w900 => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w900),
      );
  Text get bold => Text(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.bold),
      );
}

extension TextDecorationExtension on Text {
  Text get lineThrough => Text(
        data!,
        style: style?.copyWith(decoration: TextDecoration.lineThrough),
      );
  Text get overline => Text(
        data!,
        style: style?.copyWith(decoration: TextDecoration.overline),
      );
  Text get underline => Text(
        data!,
        style: style?.copyWith(decoration: TextDecoration.underline),
      );
}

extension TextOverflowExtension on Text {
  Text get clip => Text(
        data!,
        style: style?.copyWith(overflow: TextOverflow.clip),
      );
  Widget get ellipsis => Text(
        data!,
        style: style?.copyWith(overflow: TextOverflow.ellipsis),
      );
  Widget get fade => Text(
        data!,
        style: style?.copyWith(overflow: TextOverflow.fade),
      );
}

extension TextAlignExtension on Text {
  Text get center => Text(
        data!,
        textAlign: TextAlign.center,
        style: style,
      );
  Text get end => Text(
        data!,
        textAlign: TextAlign.end,
        style: style,
      );
  Text get justify => Text(
        data!,
        textAlign: TextAlign.justify,
        style: style,
      );
  Text get left => Text(
        data!,
        textAlign: TextAlign.left,
        style: style,
      );
  Text get right => Text(
        data!,
        textAlign: TextAlign.right,
        style: style,
      );
  Text get start => Text(
        data!,
        textAlign: TextAlign.start,
        style: style,
      );
}

extension FontColorExtension on Text {
  Text color(final String hexColor) {
    return Text(
      data!,
      style: style?.copyWith(color: hexColor.toColor),
    );
  }
}

extension HeightStyleExtension on Text {
  Text height(final double height) {
    return Text(
      data!,
      style: style?.copyWith(height: height),
    );
  }
}

extension FontStyleExtension on Text {
  Text get italic => Text(
        data!,
        style: style?.copyWith(fontStyle: FontStyle.italic),
      );
  Text lineHeight(final double height) => Text(
        data!,
        style: style?.copyWith(height: height / 100),
      );
}

extension TextExtension on String {
  Text requiredText({
    final Color? color,
    final double fontSize = 14,
    final FontWeight? fontWeight,
  }) {
    return Text.rich(
      TextSpan(
          text: this,
          style: TextStyle(
              color: color ?? '#476704'.toColor,
              fontSize: fontSize,
              fontWeight: fontWeight),
          children: [
            TextSpan(
              text: '*',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            )
          ]),
    );
  }
}

const List<String> ZERO_LEFT_PADDING = ["", "00", "0"];

const List<String> DIGITS = [
  "không",
  "một",
  "hai",
  "ba",
  "bốn",
  "năm",
  "sáu",
  "bảy",
  "tám",
  "chín"
];

const List<String> MULTIPLE_THOUSAND = [
  "",
  "nghìn",
  "triệu",
  "tỷ",
  "nghìn tỷ",
  "triệu tỷ",
  "tỷ tỷ"
];

bool shouldShowZeroHundred(List<String> goups) {
  List<String> reversedGroups = [...goups].reversed.toList();
  int count = reversedGroups.takeWhile((it) => it == "000").length;
  return count < reversedGroups.length - 1;
}

String readTriple(String triple, bool showZeroHundred) {
  List<int> digits = triple.split('').map(int.parse).toList();

  int a = digits[0];
  int b = digits[1];
  int c = digits[2];

  if (a == 0 && b == 0 && c == 0) {
    return "";
  } else if (a == 0 && showZeroHundred) {
    return "không trăm ${readPair(b, c)}";
  } else if (a == 0 && b == 0) {
    return DIGITS[c];
  } else if (a == 0) {
    return readPair(b, c);
  } else {
    return "${DIGITS[a]} trăm ${readPair(b, c)}";
  }
}

String readPair(int b, int c) {
  switch (b) {
    case 0:
      return c == 0 ? '' : 'linh ${DIGITS[c]}';
    case 1:
      switch (c) {
        case 0:
          return 'mười';
        case 5:
          return 'mười lăm';
        default:
          return 'mười ${DIGITS[c]}';
      }
    default:
      switch (c) {
        case 0:
          return '${DIGITS[b]} mươi ';
        case 1:
          return '${DIGITS[b]} mươi mốt';
        case 4:
          return '${DIGITS[b]} mươi tư';
        case 5:
          return '${DIGITS[b]} mươi lăm';
        default:
          return '${DIGITS[b]} mươi ${DIGITS[c]}';
      }
  }
}
