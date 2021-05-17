import 'package:flutter/material.dart';

import 'Search_Query.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*This is used for set the height of the cards in gridview*/
    final double itemHeight = (size.height - kToolbarHeight - 610) / 2;
    final double itemWidth = size.width / 2.4;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: nameController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: "Search Country",
              hintStyle: TextStyle(color: Colors.white),
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchQuery(
                              searching: nameController.text,
                            )));
              })
        ],
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("PRECAUTIONS",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 1,
            children: [
              Card(
                child: Image.asset(
                  "assets/mask.png",
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
              Card(
                child: Image.asset(
                  "assets/sanitizer.jpg",
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
              Card(
                child: Image.asset(
                  "assets/distance.jpg",
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
