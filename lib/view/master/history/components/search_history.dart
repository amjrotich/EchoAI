import 'package:virtualguide/virtualguide.dart';

class SearchHistory extends StatelessWidget {
  final List<HistoryModel> searchData;
  const SearchHistory({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showSearch(
        context: context,
        delegate: SearchPage(
          onQueryUpdate: print,
          items: searchData,
          searchStyle: TextStyle(color: AppWidget.color(context: context, lightColor: LightTheme.lightGreyColor200, darkColor: DarkTheme.darkGreyColor200)),
          searchLabel: AppText.searchHistory,
          suggestion: const Center(
            child: Text(AppText.filterSuggestionMsg),
          ),
          failure: const Center(
            child: Text(AppText.notFound),
          ),
          filter: (history) => [
            history.title,
          ],
          sort: (a, b) => a.compareTo(b),
          builder: (history) {
            return HistoryTile(
              slidableKey: "${history.title}_${history.id}",
              historyModel: HistoryModel(
                title: history.title,
                messages: history.messages,
                gptMessages: history.gptMessages,
                createdAt: history.createdAt,
                category: history.category,
                aiAssistantData: history.aiAssistantData,
              ),
            );
          },
        ),
      ),
      icon: const Icon(Icons.search),
    );
  }
}
