import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:virtualguide/virtualguide.dart';
import 'package:virtualguide/widgets/common/custom_container.dart';

class HistoryTile extends StatelessWidget {
  final String slidableKey;
  final HistoryModel historyModel;
  const HistoryTile({
    super.key,
    required this.slidableKey,
    required this.historyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(slidableKey),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) => context.read<ChatProvider>().deleteHistory(
                  id: historyModel.id.toString(),
                  title: historyModel.title.toString(),
                  context: context,
                ),
            backgroundColor: LightTheme.red,
            foregroundColor: LightTheme.whiteColor,
            icon: Icons.delete,
            label: AppText.delete,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CustomContainer(
          child: ListTile(
            title: AppWidget.text(
              msg: historyModel.title.toString(),
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: AppWidget.text(
              msg: Formatter.formatDateTime(
                dateTime: DateTime.parse(
                  historyModel.createdAt,
                ),
              ),
              fontSize: 12.0,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContinueDraftChat(
                      id: historyModel.id.toString(),
                      title: historyModel.title,
                      aiAssistantData: historyModel.aiAssistantData,
                      historyModel: historyModel,
                    ),
                  ),
                );
              },
              child: AppWidget.icon(icon: Icons.arrow_forward_ios),
            ),
          ),
        ),
      ),
    );
  }
}
