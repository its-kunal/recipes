import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/ApplicationProvider.dart';
import 'package:recipes/views/auth.dart';
import 'package:recipes/views/detail.dart';
import 'package:recipes/views/favorite.dart';
import 'package:provider/provider.dart';
import 'package:recipes/views/home.dart';
import 'package:recipes/views/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "lib/.env");

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationProvider(),
    builder: (context, child) => const MyApp(),
  ));

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationProvider>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          textTheme: GoogleFonts.workSansTextTheme(),
        ),
        darkTheme: ThemeData(
          textTheme: GoogleFonts.workSansTextTheme(),
          primarySwatch: Colors.lime,
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.light,
        routes: {
          '/userauth': (context) {
            return AuthPage();
          },
          '/home': (context) => HomePage(),
          '/recipe': (context) {
            return RecipePage();
          },
          '/profile': (context) {
            return MyProfile();
          },
          '/favorite': (context) => FavoritePage()
        },
        // initialRoute: '/home',
        home: value.isUser ? HomePage() : AuthPage(),
      ),
    );
  }
}

// GoogleFonts.workSansTextTheme(
