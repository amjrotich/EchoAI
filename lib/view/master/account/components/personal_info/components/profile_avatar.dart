import 'package:virtualguide/virtualguide.dart';
import 'package:virtualguide/widgets/common/custom_container.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final VoidCallback? onEditTap;

  const ProfileAvatar({
    super.key,
    required this.radius,
    required this.imageUrl,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(imageUrl),
        ),
        if (onEditTap != null)
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onEditTap,
              child: CustomContainer(
                padding: const EdgeInsets.all(4),
                color: LightTheme.primaryColor,
                child: AppWidget.icon(
                  icon: Icons.edit,
                  color: LightTheme.whiteColor,
                  size: 16.0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
