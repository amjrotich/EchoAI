import 'package:virtualguide/virtualguide.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
            title: "Log In",
            onTap: () => provider.signIn(context: context),
          ),
        ),
      ],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: provider.signInFormKey,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: VirtualGuide.padding*1.5, vertical: VirtualGuide.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthComponents.headingWidget(
                      context: context,
                      title: 'Welcome back 👋',
                      subTitle:
                          'Please enter your email & password to log in.'),
                  const SizedBox(height: VirtualGuide.height*2),
                  AuthComponents.emailWidget(context: context),
                  const SizedBox(height: VirtualGuide.height),
                  AuthComponents.passwordWidget(context: context),
                  const SizedBox(height: VirtualGuide.height*2),
                  AuthComponents.forgotPassWidget(context: context),
                  const SizedBox(height: VirtualGuide.height+5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LightTheme.primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: VirtualGuide.height*2),
                  AuthComponents.optionWidget(context: context),
                  const SizedBox(height: VirtualGuide.height*2),
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
