import 'package:flutter/material.dart';
import 'filter_button.dart';

class SearchFiler extends StatefulWidget {
  @override
  State<SearchFiler> createState() => _SearchFilerState();
}

class _SearchFilerState extends State<SearchFiler> {
  TextEditingController controller = TextEditingController();


  List<Item> items = itemsList;

  String selectedValue = 'New';




  @override
  Widget build(BuildContext context) {
    // getDropdownStatus();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.all(20),
            /*child: Material(
              elevation: 10.0,
              shadowColor: Colors.black,*/
            child: TextField(
              controller: controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Enter word',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.blue, width: 3.0),
                ),
              ),
              onChanged: searchItem,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                  child: Text("all"),
                  onPressed: () {
                    setState(() {
                      searchStatusNew("");
                    });
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  child: Text("New"),
                  onPressed: () {
                    setState(() {
                      searchStatusNew("new");
                    });
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  child: Text("In progress"),
                  onPressed: () {
                    setState(() {
                      searchStatusInProgress("In Progress");
                    });
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  child: Text("done"),
                  onPressed: () {
                    setState(() {
                      searchStatusDone("done");
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];


                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Тема: ${item.title}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Добавлено: 04.05.2022",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        value: item.status,
                        items: [
                          DropdownMenuItem(child: Text("New"), value: "New"),
                          DropdownMenuItem(child: Text("In Progress"), value: "In Progress"),
                          DropdownMenuItem(child: Text("Done"), value: "Done")
                        ],
                        onChanged: (value) {
                          setState(() {
                            item.status = value!;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  void searchItem(String query) {
    final suggestions = itemsList.where((item) {
      final itemTitle = item.title.toLowerCase();
      final input = query.toLowerCase();

      return itemTitle.contains(input);
    }).toList();

    setState(() {
      items = suggestions;
    });
  }

  void searchStatusNew(String query) {
    final suggestions = itemsList.where((item) {
      final itemStatus = item.status.toLowerCase();
      final input = query.toLowerCase();

      return itemStatus.contains(input);
    }).toList();

    setState(() {
      items = suggestions;
    });
  }

  void searchStatusInProgress(String query) {
    final suggestions = itemsList.where((item) {
      final itemStatus = item.status.toLowerCase();
      final input = query.toLowerCase();

      return itemStatus.contains(input);
    }).toList();

    setState(() {
      items = suggestions;
    });
  }

  void searchStatusDone(String query) {
    final suggestions = itemsList.where((item) {
      final itemStatus = item.status.toLowerCase();
      final input = query.toLowerCase();

      return itemStatus.contains(input);
    }).toList();

    setState(() {
      items = suggestions;
    });
  }
}
