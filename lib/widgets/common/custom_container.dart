import '../../virtualguide.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? color;
  const CustomContainer({
    Key? key,
    required this.child,
    this.margin,
    this.width,
    this.height,
    this.padding,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color ??
            AppWidget.color(
              context: context,
              lightColor: LightTheme.lightGreyColor300,
              darkColor: DarkTheme.darkGreyColor300,
            ),
        border: Border.all(
          color: AppWidget.color(
            context: context,
            lightColor: LightTheme.lightGreyColor,
            darkColor: DarkTheme.darkGreyColor,
          ),
          width: 4.0,
        ),
      ),
      child: child,
    );
  }
}
