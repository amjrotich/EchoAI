import 'package:virtualguide/virtualguide.dart';
import 'package:virtualguide/widgets/common/custom_container.dart';

class EmptyChatBackground extends StatelessWidget {
  const EmptyChatBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: VirtualGuide.height * 3),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: AdaptiveTheme.of(context).mode.isLight
                  ? Image.asset(ImageAssets.lightGreyLogo)
                  : Image.asset(ImageAssets.darkGreyLogo),
            ),
            const SizedBox(height: VirtualGuide.height * 2),
            AppWidget.text(
              msg: AppText.virtualGuide,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppWidget.color(
                context: context,
                lightColor: LightTheme.lightGreyColor200,
                darkColor: DarkTheme.darkGreyColor200,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: VirtualGuide.height * 2),
            CustomContainer(
              height: 55,
              width: MediaQuery.of(context).size.width,
              color: AppWidget.color(
                context: context,
                lightColor: LightTheme.lightGreyColor,
                darkColor: DarkTheme.darkGreyColor,
              ),
              child: Center(
                child: AppWidget.text(
                  msg: AppText.emptyChatBgOne,
                  color: AppWidget.color(
                    context: context,
                    lightColor: LightTheme.lightGreyColor200,
                    darkColor: DarkTheme.darkGreyColor200,
                  ),
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: VirtualGuide.height),
            CustomContainer(
              height: 55,
              width: MediaQuery.of(context).size.width,
              color: AppWidget.color(
                context: context,
                lightColor: LightTheme.lightGreyColor,
                darkColor: DarkTheme.darkGreyColor,
              ),
              child: Center(
                child: AppWidget.text(
                  msg: AppText.emptyChatBgTwo,
                  fontSize: 12.0,
                  color: AppWidget.color(
                    context: context,
                    lightColor: LightTheme.lightGreyColor200,
                    darkColor: DarkTheme.darkGreyColor200,
                  ),
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: VirtualGuide.height),
            CustomContainer(
              height: 55,
              width: MediaQuery.of(context).size.width,
              color: AppWidget.color(
                context: context,
                lightColor: LightTheme.lightGreyColor,
                darkColor: DarkTheme.darkGreyColor,
              ),
              child: Center(
                child: AppWidget.text(
                  msg: AppText.emptyChatBgThree,
                  fontSize: 12.0,
                  color: AppWidget.color(
                    context: context,
                    lightColor: LightTheme.lightGreyColor200,
                    darkColor: DarkTheme.darkGreyColor200,
                  ),
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: VirtualGuide.height * 2),
            AppWidget.text(
              msg: AppText.emptyChatBgFour,
              fontSize: 12.0,
              color: AppWidget.color(
                context: context,
                lightColor: LightTheme.lightGreyColor200,
                darkColor: DarkTheme.darkGreyColor200,
              ),
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
