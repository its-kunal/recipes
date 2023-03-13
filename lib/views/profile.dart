import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:recipes/components/bottomBar.dart';

import '../ApplicationProvider.dart';
import '../components/card.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Consumer<ApplicationProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Hello, ${value.name.split(' ')[0]}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
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
                  ListTile(
                    contentPadding: EdgeInsets.all(4),
                    leading: Icon(
                      Icons.account_circle,
                      size: 60,
                    ),
                    title: Text(
                      value.name,
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey.shade300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                      trailing: Icon(Icons.delete_forever,
                          color: Theme.of(context).primaryColor),
                      title: Text('Clear All My Data'),
                      onTap: () {
                        value.clearMyData();
                        Navigator.popAndPushNamed(context, "");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text('Change your Favorite Cuisines'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(
        selectedIndex: 2,
      ),
    );
  }
}
