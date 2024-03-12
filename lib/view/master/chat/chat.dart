import 'package:virtualguide/virtualguide.dart';

import 'components/image_generator/image_generator.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.virtualGuide,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            child: Image.asset(ImageAssets.appLogo),
          ),
          const SizedBox(height: VirtualGuide.height * 2),
          AppWidget.text(
            msg: AppText.welcomeTo,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: VirtualGuide.height - 2),
          AppWidget.text(
            msg: AppText.virtualGuide,
            fontSize: 25,
            color: LightTheme.primaryColor,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: VirtualGuide.height + 5),
          Padding(
            padding: const EdgeInsets.all(VirtualGuide.padding - 2),
            child: AppWidget.text(
              msg: AppText.subDescriptionChat,
              fontSize: 15,
              color: LightTheme.greyColor,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: VirtualGuide.height * 4),
          SubmitButton(
            title: AppText.startChat,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    aiAssistantData: {
                      "title": "VirtualGuide",
                      "route": "chat",
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: VirtualGuide.height),
          SubmitButton(
            title: AppText.imageGenerator,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImageGenerator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
