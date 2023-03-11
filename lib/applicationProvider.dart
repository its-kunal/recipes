import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationProvider extends ChangeNotifier {
  late bool isUser = false;
  late bool theme = true;
  late Map<dynamic, dynamic> user;
  late Map<dynamic, dynamic> favRecipes;

  List<String> favCuisines = [
    "Italian",
    "Indian",
    "Mexican",
    "Indian",
    "Thai",
    "Chinese",
    "Caribbean",
    "Greek"
  ];
  late SharedPreferences prefs;
  ApplicationProvider() {
    init();
  }

  init() async {
    print('HI');
    prefs = await SharedPreferences.getInstance();
    isUser = prefs.getBool('isUser') ?? false;
    prefs.get('favRecipes') != null
        ? favRecipes = prefs.get('favRecipes') as Map<dynamic, dynamic>
        : favRecipes = {};

    favCuisines = prefs.getStringList('favCuisines') ?? favCuisines;

    // favCuisines = prefs.getStringList('favCuisines') ?? [];
    theme = prefs.getBool('theme') ?? true;
    notifyListeners();
  }

  set isUserLogged(bool k) {
    isUser = k;
    prefs.setBool('isUser', k);
    notifyListeners();
  }

  // set setIsUser(bool k) {
  //   isUser = k;
  //   prefs?.setBool('isUser', isUser);
  //   notifyListeners();
  // }

  // get getIsUser => prefs?.getBool('isUser');
}

class User {
  late String name;
  late List<String> favCuisines;
  late Map<dynamic, dynamic> favRecipes;

  User(name, favCuisines, favRecipes) {
    this.name = name;
    this.favCuisines = favCuisines;
    this.favRecipes = favRecipes;
  }

  // add fav recipe --> add whole recipe to shared prefs
  // add fav cuisine
  // change name
}

class Recipe {
  late String author, cuisine;
  late List<String> ingredients, information;
  late int time_to_prepare;
  Recipe() {}

  // detailed information
  // short information
}
