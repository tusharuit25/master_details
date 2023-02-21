import 'dart:math';

import 'package:flutter/material.dart';
import 'package:master_details/item.dart';
import 'package:master_details/item_details.dart';
import 'package:master_details/item_listing.dart';

class MasterDetailContainer extends StatefulWidget {
  @override
  _ItemMasterDetailContainerState createState() =>
      _ItemMasterDetailContainerState();
}

class _ItemMasterDetailContainerState extends State<MasterDetailContainer> {
  static const int kTabletBreakpoint = 640;
  Item? _selectedItem;

  Widget _buildMobileLayout() {
    return ItemListing(
      itemSelectedCallback: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ItemDetails(
                isInTabletLayout: false,
                item: item,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 4.0,
            child: ItemListing(
              itemSelectedCallback: (item) {
                setState(() {
                  _selectedItem = item;
                });
              },
              selectedItem: _selectedItem,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: ItemDetails(
            isInTabletLayout: true,
            item: _selectedItem,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // if shortest side is greater than 640  then its a tab otherwise its mobile
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    //var longestSlide = MediaQuery.of(context).size.longestSide;

    print(shortestSide);
    //print(longestSlide);

    final bool useMobileLayout = shortestSide < 600;



    if (useMobileLayout) {

      if (isPortrait) {
        content = _buildMobileLayout();
      } else {
        content = _buildTabletLayout();
      }
    } else {

      if (isPortrait) {
        content = _buildMobileLayout();
      } else {
        content = _buildTabletLayout();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Master-detail flow sample'),
      ),
      body: content,
    );
  }
}
