import '../../virtualguide.dart';

class AppWidget {
  /// Custom Icon
  static Widget icon({
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
    required IconData? icon,
  }) {
    return Consumer<AccountProvider>(builder: (context, provider, child) {
      return Icon(
        icon,
        size: size,
        color: color ?? textColor(context: context),
      );
    });
  }

  /// Custom Text
  static Widget text(
      {required String msg,
        bool inherit = true,
        Color? color,
        Color? backgroundColor,
        double? fontSize,
        FontWeight? fontWeight,
        FontStyle? fontStyle,
        double? letterSpacing,
        double? wordSpacing,
        TextBaseline? textBaseline,
        double? height,
        TextLeadingDistribution? leadingDistribution,
        Locale? locale,
        Paint? foreground,
        Paint? background,
        List<Shadow>? shadows,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
        String? debugLabel,
        String? fontFamily,
        List<String>? fontFamilyFallback,
        String? package,
        TextOverflow? overflow,
        TextAlign? textAlign,
        int? maxLines,
        double top = 0.0,
        double left = 0.0,
        double right = 0.0,
        double bottom = 0.0}) {
    return Provider<AccountProvider>(
      create: (_) => AccountProvider(),
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(
              top: top, left: left, right: right, bottom: bottom),
          child: Text(
            msg,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color ?? textColor(context: context),
            ),
            textAlign: textAlign,
            maxLines: maxLines,
          ),
        );
      },
    );
  }

  // Text Color
  static Color textColor({required BuildContext context}) {
    return color(
      context: context,
      lightColor: LightTheme.blackColor,
      darkColor: DarkTheme.whiteColor,
    );
  }

  // Border Color
  static Color borderColor({required BuildContext context}) {
    return color(
      context: context,
      lightColor: LightTheme.lightGreyColor,
      darkColor: DarkTheme.darkGreyColor,
    );
  }

  // Divider
  static Widget divider({required BuildContext context}) {
    return Divider(
      color: color(
        context: context,
        lightColor: LightTheme.lightGreyColor200,
        darkColor: DarkTheme.darkGreyColor200,
      ),
    );
  }

  // Text Color
  static Color color({
    required BuildContext context,
    required Color lightColor,
    required Color darkColor,
  }) {
    if (AdaptiveTheme.of(context).mode.isLight) {
      return lightColor;
    } else {
      return darkColor;
    }
  }
}
