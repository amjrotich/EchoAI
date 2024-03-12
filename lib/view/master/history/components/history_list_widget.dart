import 'package:virtualguide/virtualguide.dart';

class HistoryListWidget extends StatelessWidget {
  final List<HistoryModel> searchData;
  final List<dynamic> historyData;
  const HistoryListWidget(
      {super.key, required this.historyData, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.history,
      actions: [
        SearchHistory(
          searchData: searchData,
        ),
      ],
      body: ListView.builder(
        itemCount: historyData.length,
        itemBuilder: (context, i) {
          return HistoryTile(
            slidableKey: historyData[i]['id'].toString(),
            historyModel: HistoryModel(
                id: int.parse(historyData[i]['id']),
                title: historyData[i]['title'],
                messages: historyData[i]['messages'],
                gptMessages: historyData[i]['gptMessages'],
                createdAt: historyData[i]['createdAt'],
                category: historyData[i]['category'],
                aiAssistantData: historyData[i]['aiAssistantData'],
            ),
          );
        },
      ),
    );
  }
}
