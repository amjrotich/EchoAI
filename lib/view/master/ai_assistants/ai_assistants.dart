import 'package:virtualguide/virtualguide.dart';

class AiAssistants extends StatelessWidget {
  const AiAssistants({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.aiAssistants,
      body: DefaultTabController(
        length: VirtualGuide.aiAssistantsData.length,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              contentPadding: const EdgeInsets.symmetric(horizontal: VirtualGuide.padding * 2),
              backgroundColor: LightTheme.primaryColor,
              borderWidth: 2,
              borderColor: LightTheme.primaryColor,
              unselectedBorderColor: LightTheme.primaryColor,
              unselectedBackgroundColor: AdaptiveTheme.of(context).mode.isLight
                  ? LightTheme.whiteColor : DarkTheme.blackColor,
              unselectedLabelStyle: TextStyle(
                color: LightTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              labelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              radius: 70,
              tabs: List.generate(
                VirtualGuide.aiAssistantsData.length,
                    (index) {
                  return Tab(
                    text: VirtualGuide.aiAssistantsData[index]['title'],
                  );
                },
              ).toList(),
            ),
            const SizedBox(
              height: VirtualGuide.height * 1.5,
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(
                  VirtualGuide.aiAssistantsData.length,
                      (index) => AiAssistantsCategory(
                    data: VirtualGuide.aiAssistantsData[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
