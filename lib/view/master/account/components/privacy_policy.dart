import 'package:virtualguide/virtualguide.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.privacyPolicy,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidget.text(
              msg: AppText.privacyPolicyIntro,
              top: 15.0,
              bottom: 15.0,
            ),
            AppWidget.text(
              msg: AppText.informationWeCollect,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              bottom: 15.0,
            ),
            AppWidget.text(
              msg: AppText.personalInformation,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              bottom: 8.0,
            ),
            AppWidget.text(
              msg: AppText.personalInformationIntro,
              fontSize: 14.0,
              bottom: 16.0,
            ),
            AppWidget.text(
              msg: AppText.contactUs,
              fontSize: 18.0,
              bottom: 16.0,
              fontWeight: FontWeight.bold,
            ),
            AppWidget.text(
              msg: AppText.contactUsOne,
              fontSize: 16.0,
              bottom: 16.0,
            ),
            AppWidget.text(
              msg: AppText.contactUsTwo,
              fontSize: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
