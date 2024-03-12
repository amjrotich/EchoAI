import '../../virtualguide.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Widget? subtitle;
  const CustomListTile({
    super.key,
    this.leading,
    this.trailing,
    this.onTap,
    this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: leading,
      title: Text(
        title,
        style: TextStyle(
          color: AdaptiveTheme.of(context).mode.isLight
              ? LightTheme.blackColor
              : DarkTheme.whiteColor,
        ),
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 12.0,
        color: AdaptiveTheme.of(context).mode.isLight
            ? LightTheme.lightGreyColor400
            : DarkTheme.darkGreyColor400,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}
