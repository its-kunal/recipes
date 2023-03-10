import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/views/auth.dart';
import 'package:recipes/views/detail.dart';
import 'package:recipes/views/favorite.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          '/userauth': (context) => AuthPage(),
          '/home': (context) => MyHomePage(),
          '/product': (context) {
            return ProductPage();
          },
          '/profile': (context) {
            return Scaffold();
          },
          '/favorite': (context) => FavoritePage()
        },
        initialRoute: '/home',
        home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Theme.of(context).,
            title: Text('Hello'),
          ),
          body: Center(
            child: ElevatedButton(
              child: Text('Press'),
              onPressed: () {},
            ),
          ),
        ));
  }
}

// GoogleFonts.workSansTextTheme(
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Title'),
      ),
    );
  }
}
