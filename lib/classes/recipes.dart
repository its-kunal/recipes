import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Recipe {
  late String title, sourceUrl, summary;
  late String instructions, image;
  late int readyInMinutes, servings, id;
  late bool isVegan;
  late List<dynamic> cuisines;
  static String apiKey = dotenv.env['API_KEY'] ?? "";
  static String baseUrl = "api.spoonacular.com";

  Recipe(
      int id,
      String title,
      String sourceUrl,
      String summary,
      int readyInMinutes,
      int servings,
      bool isVegan,
      List<dynamic> cuisines,
      String instructions,
      String image) {
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
    this.image = image;
  }

  // get recipes by cuisine

  static Future<List<Recipe>> getRecipeByCuisine(String a) async {
    var url = Uri.https(baseUrl, "/recipes/complexSearch",
        {'apiKey': apiKey, 'cuisine': a.toLowerCase()});
    var response = await http.get(url);
    List<Recipe> ls = [];
    if (response.statusCode == 200) {
      var jsonResponse =
          await convert.jsonDecode(response.body) as Map<String, dynamic>;
      var json = jsonResponse['results'] as List<dynamic>;
      for (var i = 0; i < json.length; i++) {
        var id = json[i]['id'];
        var url2 = Uri.https(baseUrl, "/recipes/$id/information");
        var res = await http.get(url2);
        if (res.statusCode == 200) {
          var jsonRes =
              await convert.jsonDecode(res.body) as Map<String, dynamic>;
          ls.add(Recipe(
            jsonRes['id'] as int,
            jsonRes['title'] as String,
            jsonRes['sourceUrl'] as String,
            jsonRes['summary'] as String,
            jsonRes['readyInMinutes'] as int,
            jsonRes['servings'] as int,
            jsonRes['vegan'] as bool,
            jsonRes['cuisines'] as List<dynamic>,
            jsonRes['instructions'] as String,
            jsonRes['image'] as String,
          ));
        }
      }
    }
    return ls;
  }

  // get recipe by query

  // get some random recipes
  static Future<List<Recipe>> getRandomRecipes() async {
    var url = Uri.https(
        baseUrl, "/recipes/random", {'apiKey': apiKey, 'number': '10'});
    var response = await http.get(url);
    List<Recipe> ls = [];
    if (response.statusCode == 200) {
      var jsonResponse =
          await convert.jsonDecode(response.body) as Map<String, dynamic>;
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
          jsonRes['instructions'] as String,
          jsonRes['image'] as String,
        ));
      }
    }
    return ls;
  }
  // short information
}
