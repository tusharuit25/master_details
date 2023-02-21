import 'package:flutter/material.dart';
import 'package:master_details/item.dart';
class ItemListing extends StatelessWidget {
  ItemListing({
    required this.itemSelectedCallback,
      this.selectedItem,
  });

  final ValueChanged<Item> itemSelectedCallback;
  final Item? selectedItem;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items.map((item) {
        return ListTile(
          title: Text(item.title),
          onTap: () => itemSelectedCallback(item),
          selected: selectedItem == item,
        );
      }).toList(),
    );
  }
}
