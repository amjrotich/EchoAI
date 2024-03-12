import 'package:flutter/cupertino.dart';
import 'package:virtualguide/virtualguide.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.account,
      body: Consumer<AccountProvider>(
        builder: (context, provider, child) {
          return ListView(
            children: [
              _buildListTile(
                context: context,
                leading: CircleAvatar(
                  backgroundColor: LightTheme.lightGreyColor,
                  backgroundImage: NetworkImage(
                    provider.getUserPhotoUrl(),
                  ),
                ),
                title: provider.getUserDisplayName(),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalInfo(),
                    ),
                  );
                  provider.reloadUserData();
                },
              ),
              const SizedBox(
                height: VirtualGuide.height * 1.5,
              ),
              Image.asset(ImageAssets.proBanner),
              const SizedBox(
                height: VirtualGuide.height * 1.5,
              ),
              AppWidget.divider(context: context),
              _buildListTile(
                context: context,
                leading: Icon(Icons.person),
                title: AppText.personalInfo,
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalInfo(),
                    ),
                  );
                  provider.reloadUserData();
                },
              ),
              _buildListTile(
                context: context,
                leading: Icon(Icons.security),
                title: AppText.security,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
              ),
              _buildListTile(
                context: context,
                leading: Icon(Icons.ad_units),
                title: AppText.facebookAds,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdsPage(),
                    ),
                  );
                },
              ),
              _buildListTile(
                context: context,
                leading: Icon(Icons.language),
                title: AppText.language,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
              ),
              _buildListTile(
                context: context,
                leading: Icon(Icons.remove_red_eye),
                title: AppText.darkMode,
                trailing: CupertinoSwitch(
                  trackColor: LightTheme.lightGreyColor100,
                  value: provider.darkModeEnabled,
                  onChanged: (value) {
                    provider.toggleDarkMode(context: context);
                  },
                ),
              ),
              AppWidget.divider(context: context),
              _buildListTile(
                context: context,
                leading: Icon(Icons.help),
                title: AppText.helpCenter,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpCenter(),
                    ),
                  );
                },
              ),
              _buildListTile(
                context: context,
                leading: Icon(Icons.lock),
                title: AppText.privacyPolicy,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy(),
                    ),
                  );
                },
              ),
              _buildListTile(
                context: context,
                leading: Icon(Icons.info),
                title: AppText.aboutUs,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPage(),
                    ),
                  );
                },
              ),
              Consumer<AuthenticationProvider>(
                builder: (context, authProvider, child) {
                  return _buildListTile(
                    context: context,
                    onTap: () => authProvider.signOut(context: context),
                    leading: Icon(
                      Icons.logout,
                    ),
                    title: AppText.logout,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required String title,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return CustomListTile(
      onTap: onTap,
      leading: leading,
      title: title,
      trailing: trailing,
    );
  }
}
