import 'package:virtualguide/virtualguide.dart';

class ContinueDraftChat extends StatelessWidget {
  final String id;
  final String title;
  final HistoryModel historyModel;
  final dynamic aiAssistantData;
  const ContinueDraftChat({super.key, required this.id,required this.title,required this.aiAssistantData,required this.historyModel});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom:VirtualGuide.padding * 1.5),
          child: DraftChatScreen(
            historyModel: historyModel,
            aiAssistantData: aiAssistantData,
          ),
        ),
      ),
    );
  }
}
