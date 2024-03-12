import 'package:virtualguide/virtualguide.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayNameController.text =
        FirebaseAuth.instance.currentUser!.displayName ?? '';
    emailController.text = FirebaseAuth.instance.currentUser!.email ?? '';
    phoneNumberController.text =
        FirebaseAuth.instance.currentUser!.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountProvider>(context, listen: false);
    return AppScaffold(
      title: AppText.personalInfo,
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(VirtualGuide.padding + 5),
          child: SubmitButton(
            onTap: () => provider.updateProfile(
              context: context,
              email: emailController.text,
              displayName: displayNameController.text,
            ),
            title: AppText.update,
          ),
        ),
      ],
      body: Form(
        key: provider.personalInfoFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profile(),
              const SizedBox(
                height: VirtualGuide.height * 4,
              ),
              PersonalInfoComponents.displayNameWidget(
                textEditingController: displayNameController,
              ),
              const SizedBox(height: VirtualGuide.height + 5),
              PersonalInfoComponents.emailWidget(
                textEditingController: emailController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Widget
  Widget profile() {
    return Consumer<AccountProvider>(builder: (context, provider, child) {
      return ProfileAvatar(
        radius: 45,
        imageUrl: provider.getUserPhotoUrl(),
        onEditTap: () {
          provider.pickAndCropImage(context: context);
        },
      );
    });
  }
}
