import 'package:filter_button/filter_button.dart';
import 'package:filter_button/search.dart';
import 'package:filter_button/searchfilter.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchFiler(),
    );
  }
}

/*
class Movie {
  Movie(
      {required this.movieName,
      required this.isAnimated,
      required this.rating});

  final String movieName;
  final bool isAnimated;
  final double rating;
}

List<Movie> AllMovies = [
  new Movie(movieName: "Toy Story", isAnimated: true, rating: 4.0),
  new Movie(
      movieName: "How to Train Your Dragon", isAnimated: true, rating: 4.0),
  new Movie(movieName: "Hate Story", isAnimated: false, rating: 1.0),
  new Movie(movieName: "Minions", isAnimated: true, rating: 4.0),
];
*/

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = itemsList;

  String text = "";

  @override
  Widget build(BuildContext context) {

    List<Item> searchList = itemsList
        .where((element) =>
            element.title.toLowerCase().contains(text.toLowerCase()))
        .toList();

    TextEditingController controller = TextEditingController();

    // List<Item> searchDone =
    //     itemsList.where((element) => element.status.contains(done)).toList();

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Menu"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 10000,
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                onFieldSubmitted: (value){
                  setState(() {
                    text = value;
                  });
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter word',

                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      controller.clear();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                // onChanged: (){},
              ),
              _singleItem("c"),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding: EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              1.0,
                              3.0,
                            ),
                            blurRadius: 4.0,
                            spreadRadius: 0.2,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 100,
                                alignment: Alignment.bottomLeft,
                                height: 50,
                                // child: DropdownButton<String>(
                                //   value: item.status,
                                //   items: const [
                                //     DropdownMenuItem(
                                //       child: Text(
                                //         "Новое",
                                //         style: TextStyle(
                                //           color: Colors.green,
                                //           fontSize: 12,
                                //         ),
                                //       ),
                                //       value: "Новое",
                                //     ),
                                //     DropdownMenuItem(
                                //       child: Text(
                                //         "В прогрессе",
                                //         style: TextStyle(
                                //           color: Colors.blue,
                                //           fontSize: 12,
                                //         ),
                                //       ),
                                //       value: "В прогрессе",
                                //     ),
                                //     DropdownMenuItem(
                                //       child: Text(
                                //         "Сделано",
                                //         style: TextStyle(
                                //           color: Colors.grey,
                                //           fontSize: 12,
                                //         ),
                                //       ),
                                //       value: "Сделано",
                                //     ),
                                //   ],
                                //   onChanged: (value) {
                                //     setState(() {
                                //       item.status = value!;
                                //     });
                                //   },
                                // ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _singleItem(String searchText) {
    return ElevatedButton(
      child: Text(searchText),
      onPressed: () {
        setState(() {
          text = searchText;
        });
      },
    );
  }

  void searchItem(String query) {
    final suggestions = items.where((item) {
      final itemTitle = item.title.toLowerCase();
      final input = query.toLowerCase();

      return itemTitle.contains(input);
    }).toList();

    setState(() {
      items = suggestions;
    });
  }

  void searchStatus(String query) {
    final suggestions = items.where((item) {
      final itemTitle = item.status.toLowerCase();
      final input = query.toLowerCase();

      return itemTitle.contains(input);
    }).toList();

    setState(() {
      items = suggestions;
    });
  }
}

