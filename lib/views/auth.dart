import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:recipes/ApplicationProvider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Map<int, String> favcuisines = new Map();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: Text('')),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<ApplicationProvider>(
                builder: (context, value, child) {
                  return TextField(
                    onChanged: (v) {
                      value.setUserName(v);
                    },
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      label: Text(
                        'Enter Name',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Your Favorite Cuisines',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Cuisine Chips
              Align(
                alignment: Alignment.centerLeft,
                child: CuisinesType(),
              ),
              SizedBox(
                height: 30,
              ),
              Consumer<ApplicationProvider>(
                builder: (context, value, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 9)),
                    onPressed: () {
                      if (value.name == "" || value.name == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please Enter Name!'),
                          ),
                        );
                      } else if (value.favCuisines.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please Select Some Cuisines'),
                          ),
                        );
                      } else {
                        value.setUserTrue();
                        Navigator.popAndPushNamed(context, "/");
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
              Expanded(child: Text('')),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'The Recipes ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Icon(
                      Icons.restaurant_menu,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

class CuisinesType extends StatefulWidget {
  const CuisinesType({
    super.key,
  });

  @override
  State<CuisinesType> createState() => _CuisinesTypeState();
}

class _CuisinesTypeState extends State<CuisinesType> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationProvider>(
      builder: (context, value, child) {
        var ls = value.cuisines;
        var l = value.favCuisines;
        return (value.cuisines.isNotEmpty)
            ? Wrap(
                spacing: 10,
                runSpacing: 0,
                children: List.generate(
                  ls.length,
                  (index) => InputChip(
                    selected: l.contains(ls[index]),
                    onSelected: (v) {
                      // print(index);
                      if (v) {
                        value.addFavCuisine(ls[index]);
                      } else {
                        value.removeFavCuisine(ls[index]);
                      }
                    },
                    label: Text(
                      ls[index],
                    ),
                  ),
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }
}
