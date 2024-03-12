import 'package:virtualguide/virtualguide.dart';

class TextFieldTile {
  static Widget tileWidget(
      {required TextEditingController controller,
      required VoidCallback onTap,
      required bool isTyping,
      required String category}) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            onTap: onTap,
            textEditingController: controller,
            category: category,
          ),
        ),
        const SizedBox(
          width: VirtualGuide.width+5,
        ),
        Consumer<ChatProvider>(
          builder: (context, provider, child) {
            return InkWell(
              onTap: provider.isTyping
                  ? () => provider.stopChatGenerating()
                  : onTap,
              child: CircleAvatar(
                backgroundColor: LightTheme.primaryColor,
                child: provider.isTyping
                    ? Spinkit.spinkit
                    : Icon(
                        Icons.send,
                        size: 15.0,
                        color: LightTheme.whiteColor,
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}
