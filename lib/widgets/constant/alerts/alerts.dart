import 'package:virtualguide/virtualguide.dart';

class Alerts {
  static void showErrorDialog(
      {required BuildContext context,
      required String errorMessage,
      required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AdaptiveTheme.of(context).mode.isLight
              ? LightTheme.whiteColor
              : DarkTheme.darkGreyColor300,
          title: AppWidget.text(msg: title),
          content: AppWidget.text(msg: errorMessage),
          actions: <Widget>[
            TextButton(
              child: AppWidget.text(msg: 'OK', color: LightTheme.primaryColor),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
