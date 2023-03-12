import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  String baseUrl = "https://api.spoonacular.com";
  String apiKey = dotenv.env['API_KEY'] ?? "";
  late SharedPreferences prefs;

  ApplicationProvider() {
    init();
  }

  init() async {
    print('HI');
    prefs = await SharedPreferences.getInstance();
    isUser = prefs.getBool('isUser') ?? false;
    if (isUser) {}
    prefs.get('favRecipes') != null
        ? favRecipes = prefs.get('favRecipes') as Map<dynamic, dynamic>
        : favRecipes = {};

    favCuisines = prefs.getStringList('favCuisines') ?? favCuisines;

    // favCuisines = prefs.getStringList('favCuisines') ?? [];
    theme = prefs.getBool('theme') ?? true;
    notifyListeners();
    // Recipe.getRandomRecipes();
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
  late List<Recipe> favRecipes;

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
  late String title, sourceUrl, summary;
  late String instructions;
  late int readyInMinutes, servings, id;
  late bool isVegan;
  late List<dynamic> cuisines;
  static String apiKey = dotenv.env['API_KEY'] ?? "";
  static String baseUrl = "https://api.spoonacular.com";


  Recipe(
      int id,
      String title,
      String sourceUrl,
      String summary,
      int readyInMinutes,
      int servings,
      bool isVegan,
      List<dynamic> cuisines,
      String instructions) {
    this.id = id;
    this.title = title;
    this.sourceUrl = sourceUrl;
    this.summary = summary;
    this.instructions = instructions;
    this.cuisines = cuisines;
    this.readyInMinutes = readyInMinutes;
    this.servings = servings;
    this.isVegan = isVegan;
    this.instructions = instructions;
  }

  // detailed information

  // get some random recipes
  static Future<List<Recipe>> getRandomRecipes() async {
    var url = Uri.https(
        baseUrl, "/recipes/random", {'apiKey': apiKey, 'number': '10'});
    var response = await http.get(url);
    List<Recipe> ls = [];
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var json = jsonResponse['recipes'] as List<dynamic>;
      for (var i = 0; i < json.length; i++) {
        var jsonRes = json[i];
        ls.add(Recipe(
            jsonRes['id'] as int,
            jsonRes['title'] as String,
            jsonRes['sourceUrl'] as String,
            jsonRes['summary'] as String,
            jsonRes['readyInMinutes'] as int,
            jsonRes['servings'] as int,
            jsonRes['vegan'] as bool,
            jsonRes['cuisines'] as List<dynamic>,
            jsonRes['instructions'] as String));
      }
    }
    return ls;
  }
  // short information
}
