import 'package:virtualguide/virtualguide.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* Firebase Initialize */
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check User Logging or Not
  final auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  runApp(
    Builder(builder: (context) {
      if (Responsive.isDesktop(context)) {
        return DeskTopView(
          user: user,
        );
      } else {
        return MyApp(user: user);
      }
    }),
  );
}

class MyApp extends StatelessWidget {
  final User? user;
  const MyApp({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = user != null;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
            create: (context) => NavigationProvider()),
        ChangeNotifierProvider<ChatProvider>(
            create: (context) => ChatProvider()),
        ChangeNotifierProvider<AccountProvider>(
            create: (context) => AccountProvider()),
        ChangeNotifierProvider<AuthenticationProvider>(
            create: (context) => AuthenticationProvider()),
      ],
      child: OverlaySupport.global(
        child: AdaptiveTheme(
          light: LightTheme.light(context: context),
          dark: DarkTheme.dark(context: context),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) {
            return MaterialApp(
              title: 'VirtualGuide',
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              home: isLoggedIn ? const MasterScreen() : const WelcomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
