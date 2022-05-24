
class Item {
  final String title;
  late final String status;
  Item(this.status, this.title);
}

String text = "";



List<Item> itemsList = [
  Item("In Progress", "Clean"),
  Item("Done", "Work"),
  Item("New", "Repair"),
  Item("In Progress", "Broken"),
  Item("In Progress", "Remaster"),
];