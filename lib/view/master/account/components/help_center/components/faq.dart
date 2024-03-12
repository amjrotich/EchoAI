import 'package:virtualguide/virtualguide.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: VirtualGuide.faqData.length,
      itemBuilder: (context, index) {
        final question = VirtualGuide.faqData[index]['question'];
        final answer = VirtualGuide.faqData[index]['answer'];
        return ExpansionTile(
          collapsedIconColor: AppWidget.textColor(context: context),
          childrenPadding: EdgeInsets.zero,
          title: AppWidget.text(
            msg: question!,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppWidget.text(msg: answer!),
            ),
          ],
        );
      },
    );
  }
}
