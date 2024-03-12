import 'package:virtualguide/virtualguide.dart';

class DraftChatScreen extends StatefulWidget {
  final HistoryModel historyModel;
  final dynamic aiAssistantData;
  const DraftChatScreen(
      {super.key, required this.historyModel, required this.aiAssistantData});

  @override
  State<DraftChatScreen> createState() => _DraftChatScreenState();
}

class _DraftChatScreenState extends State<DraftChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChatProvider>().messages = widget.historyModel.messages;
    context.read<ChatProvider>().gptMessages = widget.historyModel.gptMessages;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await backChecker(),
      child: Column(
        children: [
          Consumer<ChatProvider>(
            builder: (context, provider, child) {
              return Builder(
                builder: (context) {
                  if (provider.messages.isNotEmpty) {
                    return Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: provider.messages.length,
                          itemBuilder: (context, index) {
                            return ChatMessage(
                              message: Message(
                                text: provider.messages[index]['content'],
                                sender: provider.messages[index]['role'],
                                isMe: provider.messages[index]['isMe'],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const EmptyChatBackground();
                  }
                },
              );
            },
          ),
          Column(
            children: [
              Divider(
                height: 1.0,
                color: AppWidget.color(
                  context: context,
                  lightColor: LightTheme.lightGreyColor,
                  darkColor: DarkTheme.darkGreyColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: VirtualGuide.padding+8,
                ),
                child: TextFieldTile.tileWidget(
                  controller: _controller,
                  onTap: () => _sendMessage(),
                  isTyping: context.read<ChatProvider>().isTyping,
                  category: widget.aiAssistantData['route'],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Send Msg - request for GPT
  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    context.read<ChatProvider>().addMessages(
      text: _controller.text,
      sender: "user",
      isMe: true,
    );
    context.read<ChatProvider>().isTyping = true;
    _controller.clear();

    try {
      if (widget.aiAssistantData['route'] == AppText.writingAnArticles ||
          widget.aiAssistantData['route'] == AppText.academicWriter ||
          widget.aiAssistantData['route'] == AppText.summarize ||
          widget.aiAssistantData['route'] == AppText.songAndLyrics ||
          widget.aiAssistantData['route'] == AppText.storyteller ||
          widget.aiAssistantData['route'] == AppText.poems ||
          widget.aiAssistantData['route'] == AppText.movieScript ||
          widget.aiAssistantData['route'] == AppText.emailWriter ||
          widget.aiAssistantData['route'] == AppText.jobPost ||
          widget.aiAssistantData['route'] == AppText.advertisements ||
          widget.aiAssistantData['route'] == AppText.linkedin ||
          widget.aiAssistantData['route'] == AppText.instagram ||
          widget.aiAssistantData['route'] == AppText.twitter ||
          widget.aiAssistantData['route'] == AppText.facebook ||
          widget.aiAssistantData['route'] == AppText.birthday ||
          widget.aiAssistantData['route'] == AppText.apology ||
          widget.aiAssistantData['route'] == AppText.invitation ||
          widget.aiAssistantData['route'] == AppText.tellAJoke ||
          widget.aiAssistantData['route'] == AppText.foodRecipes ||
          widget.aiAssistantData['route'] == AppText.dietPlan ||
          widget.aiAssistantData['route'] == AppText.grammarCorrection ||
          widget.aiAssistantData['route'] == AppText.interviewQuestions ||
          widget.aiAssistantData['route'] == AppText.writeCode) {
        String response = await UserService.generationWithGPT(
          context: context,
          message: context.read<ChatProvider>().gptMessages.last['content'],
          prompt: widget.aiAssistantData['prompt'],
          model: widget.aiAssistantData['model'],
          maxTokens: widget.aiAssistantData['max_tokens'],
        );
        insertNewData(response);
      } else if (widget.aiAssistantData['route'] == AppText.explainCode) {
        String response = await UserService.explainCodeWithGPT(
          context: context,
          message: context.read<ChatProvider>().gptMessages.last['content'],
          prompt: widget.aiAssistantData['prompt'],
          model: widget.aiAssistantData['model'],
          maxTokens: widget.aiAssistantData['max_tokens'],
        );
        insertNewData(response);
      } else {
        String response = await UserService.chatWithGPT(
          context: context,
          message: context.read<ChatProvider>().gptMessages,
        );
        insertNewData(response);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          context.read<ChatProvider>().isTyping = false;
        }
      }
    }
  }

  // Response Msg - response for GPT
  void insertNewData(String response) {
    context
        .read<ChatProvider>()
        .addMessages(text: response, sender: "system", isMe: false);
    context.read<ChatProvider>().isTyping = false;
  }

  // Back Restriction And Save Data Into Database
  Future<bool> backChecker() {
    if (context.read<ChatProvider>().isTyping) {
      return Future.value(false);
    } else {
      if (context.read<ChatProvider>().messages.isNotEmpty) {
        context.read<ChatProvider>().updateDatabase(
          context: context,
          title: Formatter.generateTitle(
            title: context.read<ChatProvider>().messages[
            context.read<ChatProvider>().messages.length - 1]
            ['content'],
          ),
          id: widget.historyModel.id.toString(),
          category: widget.aiAssistantData['route'],
          aiAssistantData: widget.aiAssistantData,
        );
      }else {
        return Future.value(true);
      }
      return Future.value(false);
    }
  }
}
