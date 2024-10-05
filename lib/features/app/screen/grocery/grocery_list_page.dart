import 'package:flutter/material.dart';

class GroceryItem {
  String name;
  bool isBought;
  GroceryItem(this.name, {this.isBought = false});
}

class GroceryListPage extends StatefulWidget {
  const GroceryListPage({super.key});

  @override
  State<GroceryListPage> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListPage> {
  List<GroceryItem> groceryList = [];

  final TextEditingController _controller = TextEditingController();

  void _addItem(String itemName) {
    setState(() {
      groceryList.add(GroceryItem(itemName));
    });
    _controller.clear();
  }

  void _toggleBoughtStatus(int index) {
    setState(() {
      groceryList[index].isBought = !groceryList[index].isBought;
    });
  }

  void _removeItem(int index) {
    setState(() {
      groceryList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách thực phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Thanh nhập tên thực phẩm
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Thêm thực phẩm...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _addItem(_controller.text);
                    }
                  },
                  child: const Text('Thêm'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Danh sách thực phẩm
            Expanded(
              child: ListView.builder(
                itemCount: groceryList.length,
                itemBuilder: (context, index) {
                  final item = groceryList[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: item.isBought,
                        onChanged: (value) {
                          _toggleBoughtStatus(index);
                        },
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(
                          decoration: item.isBought
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
