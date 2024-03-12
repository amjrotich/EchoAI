import 'package:virtualguide/virtualguide.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.about,
      body: ListView(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            child: Image.asset(ImageAssets.appLogo),
          ),
          const SizedBox(height: VirtualGuide.height * 1.5),
          AppWidget.text(
            msg: AppText.virtualGuideNameVersion,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            top: 15.0,
            bottom: 15.0,
          ),
          AppWidget.divider(context: context),
          for (int i = 0; i < VirtualGuide.aboutUsData.length; i++)
            _buildListTile(
              context: context,
              title: VirtualGuide.aboutUsData[i],
            ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required String title,
    Widget? leading,
    VoidCallback? onTap,
  }) {
    return CustomListTile(
      onTap: onTap,
      leading: leading,
      title: title,
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20.0,
      ),
    );
  }
}
