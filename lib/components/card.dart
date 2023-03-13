import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/ApplicationProvider.dart';
import 'package:recipes/classes/recipes.dart';
import 'package:recipes/views/SearchPage.dart';
import 'package:recipes/views/detail.dart';

class MyCard extends StatelessWidget {
  final int index;
  final String title;
  const MyCard({Key? key, required this.index, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationProvider>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () async {
            print(title);
            value.getRecipeByCusine(title);
            // List<Recipe> ls = [];
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return MySearchPage();
              },
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(21)),
              border: Border(
                left: BorderSide(width: 1, color: Colors.grey),
                top: BorderSide(width: 1, color: Colors.grey),
                right: BorderSide(width: 1, color: Colors.grey),
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
              image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black, BlendMode.softLight),
                  image: AssetImage('lib/assets/${title.toLowerCase()}.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.9),
            ),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyCardTile extends StatelessWidget {
  final Recipe r;
  const MyCardTile({Key? key, required this.r}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return RecipePage(r: r);
          },
        ));
      },
      child: ListTile(
        title: Text(r.title),
        subtitle: Row(
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
        leading: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(width: 1, color: Colors.grey.shade100),
              top: BorderSide(width: 1, color: Colors.grey.shade100),
              right: BorderSide(width: 1, color: Colors.grey.shade100),
              bottom: BorderSide(width: 1, color: Colors.grey.shade100),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: r.image == ""
                // ? Image.asset('lib/assets/${r.cuisines[0]}.jpg')
                ? DecorationImage(
                    image: AssetImage('lib/assets/${r.cuisines[0]}.jpg'))
                : DecorationImage(
                    image: NetworkImage(r.image), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
