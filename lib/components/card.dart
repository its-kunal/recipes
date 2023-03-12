import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final int index;
  const MyCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(21)),
        border: Border(
          left: BorderSide(width: 2, color: Colors.grey),
          top: BorderSide(width: 2, color: Colors.grey),
          right: BorderSide(width: 2, color: Colors.grey),
          bottom: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Title $index',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
