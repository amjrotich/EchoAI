import 'package:virtualguide/virtualguide.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Pages
  List<Widget> widgetOptions = const <Widget>[
    Chat(),
    AiAssistants(),
    History(),
    Account(),
  ];
}
