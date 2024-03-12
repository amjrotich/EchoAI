import 'package:virtualguide/virtualguide.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.virtualGuide,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AdaptiveTheme.of(context).mode.isLight
                  ? Image.asset(
                      ImageAssets.empty,
                      height: MediaQuery.of(context).size.width / 2,
                    )
                  : Image.asset(
                      ImageAssets.darkEmpty,
                      height: MediaQuery.of(context).size.width / 2,
                    ),
              AppWidget.text(
                  msg: AppText.empty,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 8.0,
              ),
              AppWidget.text(msg: AppText.youHaveNoHistory),
            ],
          ),
        ),
      ),
    );
  }
}
