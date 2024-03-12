import 'package:virtualguide/virtualguide.dart';
import 'package:virtualguide/widgets/common/custom_container.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: ListView.builder(
        itemCount: VirtualGuide.contactData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: CustomContainer(
              height: 65,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomListTile(
                title: VirtualGuide.contactData[index]['title'],
              ),
            ),
          );
        },
      ),
    );
  }
}
