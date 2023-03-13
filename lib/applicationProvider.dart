import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipes/classes/recipes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApplicationProvider extends ChangeNotifier {
  late bool isUser = false;
  late Map<dynamic, dynamic> user;
  late List<Recipe> favRecipes = [];
  late List<Recipe> recipes;
  String name = "";
  List<String> cuisines = [
    "Italian",
    "Indian",
    "Mexican",
    "Thai",
    "Chinese",
    "Caribbean",
    "Greek"
  ];
  List<String> favCuisines = ["Indian"];
  String baseUrl = "api.spoonacular.com";
  String apiKey = dotenv.env['API_KEY'] ?? "";
  late SharedPreferences prefs;

  ApplicationProvider() {
    init();
  }

  void addFavCuisine(String a) {
    if (!favCuisines.contains(a)) favCuisines.add(a);
    notifyListeners();
    prefs.setStringList('favCuisines', favCuisines);
  }

  void removeFavCuisine(String a) {
    if (favCuisines.contains(a)) {
      favCuisines.remove(a);
    }
    notifyListeners();
    prefs.setStringList('favCuisines', favCuisines);
  }

  void setUserTrue() {
    isUser = true;
    prefs.setBool('isUser', true);
    notifyListeners();
  }

  void setUserName(String a) {
    name = a;
    prefs.setString('name', name);
    notifyListeners();
  }

  void clearMyData() {
    isUser = false;
    prefs.setBool('isUser', false);
    notifyListeners();
    prefs.clear();
  }

  getRecipes() async {
    var l = await Recipe.getRandomRecipes();
    recipes = l;
    notifyListeners();
  }

  clearAllFavRecipes() async {
    favRecipes.clear();
    notifyListeners();
  }

  getRecipeByCusine(String s) async {
    recipes = await Recipe.getRecipeByCuisine(s);
    print(recipes[0].title);
    notifyListeners();
  }

  void toggleFavRecipe(Recipe r) {
    if (favRecipes.contains(r)) {
      favRecipes.remove(r);
    } else {
      favRecipes.add(r);
    }
    notifyListeners();
  }

  init() async {
    print('HI');
    prefs = await SharedPreferences.getInstance();
    isUser = prefs.getBool('isUser') ?? false;
    if (isUser) {
      name = prefs.getString('name') ?? name;
      favCuisines = prefs.getStringList('favCuisines') ?? favCuisines;
    }
    prefs.get('favRecipes') != null
        ? favRecipes = prefs.get('favRecipes') as List<Recipe>
        : favRecipes = [];

    favCuisines = prefs.getStringList('favCuisines') ?? favCuisines;

    await getRecipes();
    // favCuisines = prefs.getStringList('favCuisines') ?? [];
    notifyListeners();
    // var ls = await Recipe.getRandomRecipes();
    // print(ls[0].title);
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
