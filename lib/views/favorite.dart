import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipes/components/bottomBar.dart';

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
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(''),
                    ),
                  ),
                ),
              ),
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
