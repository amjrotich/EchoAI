import 'package:virtualguide/virtualguide.dart';

class PersonalInfoComponents {
  static Widget emailWidget(
          {required TextEditingController textEditingController}) =>
      _buildTextField(textEditingController, AppText.email, Icons.email);

  static Widget displayNameWidget(
          {required TextEditingController textEditingController}) =>
      _buildTextField(textEditingController, AppText.displayName, Icons.person);

  static Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    IconData icon,
  ) {
    return Consumer<AccountProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidget.text(msg: hintText),
          TextFormField(
            controller: controller,
            cursorColor: LightTheme.primaryColor,
            decoration: InputDecoration(
              suffixIcon: Icon(icon),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppWidget.color(
                context: context,
                lightColor: LightTheme.lightGreyColor700,
                darkColor: DarkTheme.darkGreyColor700,
              )),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: LightTheme.primaryColor),
              ),
            ),
            validator: (v) {
              if (v.toString().isEmpty) {
                return hintText;
              } else if (!v.toString().contains('@')) {
                return AppText.emailValidation2;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
