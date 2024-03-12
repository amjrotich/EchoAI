import 'package:virtualguide/virtualguide.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(VirtualGuide.padding+5),
          child: SubmitButton(
            title: "Register",
            onTap: () => provider.signUp(context: context),
          ),
        ),
      ],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: provider.signUpFormKey,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: VirtualGuide.padding * 1.5,
                  vertical: VirtualGuide.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthComponents.headingWidget(
                      context: context,
                      title: 'Hello there 👋',
                      subTitle:
                          'Please enter your email & password to create an account.'),
                  const SizedBox(height: VirtualGuide.height * 2),
                  AuthComponents.emailWidget(context: context),
                  const SizedBox(height: VirtualGuide.height),
                  AuthComponents.passwordWidget(context: context),
                  const SizedBox(height: VirtualGuide.height * 2),
                  AuthComponents.forgotPassWidget(context: context),
                  const SizedBox(height: VirtualGuide.height + 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LightTheme.primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: VirtualGuide.height * 2),
                  AuthComponents.optionWidget(context: context),
                  const SizedBox(height: VirtualGuide.height * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AuthButton(
                        isGoogle: true,
                        onTap: () =>
                            provider.signInWithGoogle(context: context),
                      ),
                      AuthButton(
                        isGoogle: false,
                        onTap: () => provider.goToPhoneScreen(context: context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
