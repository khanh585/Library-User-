import 'package:flutter/material.dart';
import 'package:user_library/models/wishlist.dart';

class WishListItem extends StatefulWidget {
  final WishList wishlist;
  final bool isTick;
  const WishListItem({this.wishlist, this.isTick});

  @override
  _WishListItemState createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.widget.wishlist.name),
      subtitle: Text('${this.widget.wishlist.author}'),
      trailing: Checkbox(
        onChanged: null,
        activeColor: Theme.of(context).primaryColor,
        value: this.widget.isTick,
      ),
    );
  }
}
