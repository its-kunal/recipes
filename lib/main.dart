import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/ApplicationProvider.dart';
import 'package:recipes/views/auth.dart';
import 'package:recipes/views/detail.dart';
import 'package:recipes/views/favorite.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp(
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
          '/home': (context) => MyHomePage(),
          '/recipe': (context) {
            return RecipePage();
          },
          '/profile': (context) {
            return Scaffold();
          },
          '/favorite': (context) => FavoritePage()
        },
        initialRoute: '/userauth',
        home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Theme.of(context).,
            title: Text('Hello, '),
          ),
          body: Column(
            children: [
              Center(
                child: ElevatedButton(
                  child: Text('Press'),
                  onPressed: () {},
                ),
              ),
              Consumer<ApplicationProvider>(
                builder: (context, value, child) {
                  return Container(
                    child: Column(
                      children: [
                        Text(
                          value.isUser.toString(),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              value.isUserLogged = !value.isUser;
                            },
                            child: Text('Toogle IsUser'))
                      ],
                    ),
                  );
                },
              )
            ],
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
