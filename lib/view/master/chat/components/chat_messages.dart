import 'package:markdown/markdown.dart' as md;
import 'package:virtualguide/virtualguide.dart';

class ChatMessage extends StatelessWidget {
  final Message message;
  const ChatMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: VirtualGuide.padding - 2),
          child: Builder(
            builder: (context) {
              if (message.isMe) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: LightTheme.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: message.isMe ? Colors.white : Colors.black,
                    ),
                  ),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 4.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: AdaptiveTheme.of(context).mode.isLight
                              ? LightTheme.lightGreyColor
                              : DarkTheme.darkGreyColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: HtmlWidget(
                          md.markdownToHtml(
                            message.text.trim().toString(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.copy,
                            size: 18.0,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? LightTheme.lightGreyColor200
                                : DarkTheme.darkGreyColor200,
                          ),
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: message.text,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.share,
                            size: 18.0,
                            color: AdaptiveTheme.of(context).mode.isLight
                                ? LightTheme.lightGreyColor200
                                : DarkTheme.darkGreyColor200,
                          ),
                          onTap: () {
                            Share.share(message.text);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: VirtualGuide.width,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
