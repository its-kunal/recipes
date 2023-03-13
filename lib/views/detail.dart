import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:recipes/ApplicationProvider.dart';
import 'package:recipes/classes/recipes.dart';

class RecipePage extends StatelessWidget {
  final Recipe r;
  const RecipePage({Key? key, required this.r}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(r.title),
            actions: [
              GestureDetector(
                onTap: () {
                  value.toggleFavRecipe(r);
                },
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    // child: Icon(Icons.favorite_outline),
                    child: value.favRecipes
                            .where((element) => element.id == r.id)
                            .isNotEmpty
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_outline)),
              )
            ],
          ), // body: ,

          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 250,
                  child: Image.network(r.image),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        r.title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.groups_3),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${r.servings.toString()} servings',
                          // overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.timer),
                        SizedBox(
                          width: 4,
                        ),
                        Text('${r.readyInMinutes} min')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.eco,
                          color: r.isVegan ? Colors.green : Colors.grey,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(r.isVegan ? 'Vegan' : 'Non-Vegan')
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      'Summary',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Html(
                  data: r.summary,
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Instructions',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Html(data: r.instructions),
                SizedBox(
                  height: 10,
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
