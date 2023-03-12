import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipes/components/bottomBar.dart';

import '../components/card.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

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
                children: [
                  Text(
                    'Hello, ',
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
                  'Name of User',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey.shade300,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(
        selectedIndex: 2,
      ),
    );
  }
}
