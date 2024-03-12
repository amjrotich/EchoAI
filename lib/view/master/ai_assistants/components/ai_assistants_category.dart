import 'package:virtualguide/virtualguide.dart';
import 'package:virtualguide/widgets/common/custom_container.dart';

class AiAssistantsCategory extends StatelessWidget {
  final dynamic data;
  const AiAssistantsCategory({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data['slug'] == "all") {
      return allBody(featuresData: data['feature']);
    } else {
      return otherBody(context: context, featuresData: data['feature']);
    }
  }

  Widget allBody({required List featuresData}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: featuresData.length,
      itemBuilder: (context, i) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: AppWidget.text(
                msg: "${featuresData[i]['title']}",
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 190,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  featuresData[i]['feature'].length,
                      (index) => Padding(
                    padding: const EdgeInsets.only(right: VirtualGuide.padding+5),
                    child: GestureDetector(
                      onTap: () => onClickCard(
                          context: context,
                          data: featuresData[i]['feature'][index]),
                      child: CustomContainer(
                        height: 190,
                        width: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(VirtualGuide.padding+5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: featuresData[i]['feature'][index]
                                  ['bgColor'],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  featuresData[i]['feature'][index]['icon'],
                                  color: LightTheme.whiteColor,
                                ),
                              ),
                              const SizedBox(
                                height: VirtualGuide.height+5,
                              ),
                              AppWidget.text(
                                msg: featuresData[i]['feature'][index]['title'],
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: VirtualGuide.height,
                              ),
                              AppWidget.text(
                                msg: featuresData[i]['feature'][index]['desc'],
                                fontSize: 12.0,
                                color: AdaptiveTheme.of(context).mode.isLight
                                    ? LightTheme.lightGreyColor500
                                    : DarkTheme.darkGreyColor500,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget otherBody(
      {required BuildContext context, required List featuresData}) {
    return GridView.extent(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      maxCrossAxisExtent: 220.0,
      childAspectRatio: 0.9,
      children: List.generate(
        featuresData.length,
            (index) => GestureDetector(
          onTap: () => onClickCard(context: context, data: featuresData[index]),
          child: CustomContainer(
            height: 210,
            width: 190,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: featuresData[index]['bgColor'],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Icon(
                      featuresData[index]['icon'],
                      color: LightTheme.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  AppWidget.text(
                    msg: featuresData[index]['title'],
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppWidget.text(
                    msg: featuresData[index]['desc'],
                    fontSize: 12.0,
                    color: AdaptiveTheme.of(context).mode.isLight
                        ? LightTheme.lightGreyColor500
                        : DarkTheme.darkGreyColor500,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ],
              ),
            ),
          ),
        ),
      ).toList(),
    );
  }

  void onClickCard({required dynamic data, required BuildContext context}) {
    // Remove "icon" field from the data
    data.remove("icon");
    data.remove("bgColor");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          aiAssistantData: data,
        ),
      ),
    );
  }
}
