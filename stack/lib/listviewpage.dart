import 'package:flutter/material.dart';

import 'receipescreen.dart';

class ListView extends StatefulWidget {
  const ListView({Key? key}) : super(key: key);

  @override
  State<ListView> createState() => _ListViewState();
}

class _ListViewState extends State<ListView> {
  List foodNames = [
    "Cheesecake",
    "Burger",
    "Cupcake",
    "Berry Cake",
    "Pizza",
    "Meatloaf",
    "Pie",
    "Cookie",
    "Sausage Rolls"
  ];
  Widget _eachReceipe(foodName) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListTile(
        onTap: (() async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ReceipeScreen(),
            ),
          );
        }),
        trailing: Container(
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 34,
            color: Colors.black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 65,
              width: 65,
              margin: EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://picsum.photos/300?random=${DateTime.now().millisecondsSinceEpoch + foodName.toString().length}'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              foodName,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              'Dessert',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.white),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(color: Colors.greenAccent),
                ),
                Text(
                  'Breakfast',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Your receipe',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black),
                ),
              ),
              for (var foodName in foodNames) _eachReceipe(foodName)
            ],
          ),
        ),
      ),
    );
  }
}
