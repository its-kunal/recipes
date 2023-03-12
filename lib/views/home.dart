import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/retry.dart';

import '../components/bottomBar.dart';
import '../components/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
              SearcgBox(),
              SizedBox(
                height: 10,
              ),
              Align(
                child: Text(
                  'Popular Cuisines',
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
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyCard(index: index),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                child: Text(
                  'Popular Recipes',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              Column(
                children: [],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(
        selectedIndex: 0,
      ),
    );
  }
}

class SearcgBox extends StatelessWidget {
  const SearcgBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          width: 49,
          height: 49,
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.search),
          ),
        )
      ],
    );
  }
}
