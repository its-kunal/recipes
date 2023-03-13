import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:recipes/components/bottomBar.dart';

import '../ApplicationProvider.dart';
import '../components/card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Favorite Recipes ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Icon(Icons.favorite)
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    child: Text(
                      'Recipes',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Row(
                    children: [
                      Consumer<ApplicationProvider>(
                        builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              value.clearAllFavRecipes();
                            },
                            child: Icon(
                              Icons.delete_forever,
                              color: Theme.of(context).primaryColor,
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Consumer<ApplicationProvider>(
                builder: (context, value, child) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          value.favRecipes.length,
                          (index) => MyCardTile(
                            r: value.favRecipes[index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(
        selectedIndex: 1,
      ),
    );
  }
}
