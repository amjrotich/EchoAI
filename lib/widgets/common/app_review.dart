import 'package:virtualguide/virtualguide.dart';

class AppReviewSection extends StatefulWidget {
  const AppReviewSection({super.key});

  @override
  State<AppReviewSection> createState() => _AppReviewSectionState();
}

class _AppReviewSectionState extends State<AppReviewSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_currentIndex < VirtualGuide.appReviews.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollToIndex(_currentIndex);
    });
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 200.0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: VirtualGuide.appReviews.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                width: 250.0,
                decoration: BoxDecoration(
                  color: LightTheme.blackColor,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: LightTheme.whiteColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidget.text(
                        msg: VirtualGuide.appReviews[index]['name'] ?? '',
                        color: LightTheme.greyColor,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.fade,
                        fontSize: 18.0,
                      ),
                      const SizedBox(height: 15.0),
                      AppWidget.text(
                        msg: VirtualGuide.appReviews[index]['review'] ?? '',
                        maxLines: 3,
                        color: LightTheme.whiteColor,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
