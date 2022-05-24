import 'package:filter_button/filter_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  List<Item> searchList = itemsList
      .where(
          (element) => element.title.toLowerCase().contains(text.toLowerCase()))
      .toList();

  // List<Item> items = itemsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller,
            onFieldSubmitted: (covariant) {
              setState(() {
                text = covariant;
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 10),
                _allItems(""),
                SizedBox(width: 10),
                _singleItem("Icon"),
                SizedBox(width: 10),
                _singleItem("Button"),
                SizedBox(width: 10),
                _singleItem("Text"),
              ],
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 3),
              child: Text("Search: ${text}"),
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 1000,
                    child: Expanded(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                searchList[index].title,
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _singleItem(String searchText) {
    return RaisedButton(
      child: Text(searchText),
      onPressed: () {
        setState(() {
          text = searchText;
        });
      },
    );
  }

  Widget _allItems(String searchText) {
    return RaisedButton(
        child: Text("all"),
        onPressed: () {
          setState(() {
            text = searchText;
          });
        });
  }
}
