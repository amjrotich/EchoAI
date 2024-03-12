import 'package:virtualguide/virtualguide.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onTap;
  final String category;
  const CustomTextField(
      {super.key,
      required this.textEditingController,
      required this.onTap,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return TextFormField(
          enabled: chatProvider.isTyping ? false : true,
          textAlignVertical: TextAlignVertical.center,
          controller: textEditingController,
          minLines: 1,
          maxLines: 10,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => onTap(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 10.0,
              top: 16,
              bottom: 16,
              right: 10.0,
            ),
            filled: true,
            isDense: true,
            hintText: category == AppText.chat
                ? AppText.askAnything
                : AppText.enterYourTopic,
            hintStyle: TextStyle(
              color: AdaptiveTheme.of(context).mode.isLight
                  ? LightTheme.lightGreyColor200
                  : DarkTheme.darkGreyColor200,
              fontSize: 13.0,
            ),
            fillColor: AdaptiveTheme.of(context).mode.isLight
                ? LightTheme.lightGreyColor
                : DarkTheme.darkGreyColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: LightTheme.primaryColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: LightTheme.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
