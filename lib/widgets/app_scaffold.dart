import '../virtualguide.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget body;
  final PreferredSizeWidget? bottom;
  final List<Widget>? persistentFooterButtons;
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.persistentFooterButtons,
    this.bottom
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: VirtualGuide.padding * 2),
          child: Image.asset(
            "assets/images/green_logo.png",
            height: 10,
          ),
        ),
        leadingWidth: 40,
        title: Text(title),
        actions: actions,
        bottom: bottom,
      ),
      persistentFooterButtons: persistentFooterButtons,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: body,
      ),
    );
  }
}
