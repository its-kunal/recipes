import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:recipes/components/card.dart';

import '../ApplicationProvider.dart';
import '../classes/recipes.dart';

class MySearchPage extends StatelessWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ApplicationProvider>(
        builder: (context, value, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'The Recipes ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Icon(Icons.restaurant_menu)
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
                    children: [Text('Search Results'), Text('')],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: value.recipes.isNotEmpty
                          ? Column(
                              children: List.generate(
                                  value.recipes.length,
                                  (index) =>
                                      MyCardTile(r: value.recipes[index])),
                            )
                          : CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
