import 'package:flutter/material.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/wishlish_screen/widget/book_item.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_bloc.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_event.dart';
import 'package:user_library/screen/wishlish_screen/wishlist_screen_state.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({Key key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final _wishlistScreenBloc = WishListScreenBloc();
  @override
  void initState() {
    _refreshWishList(true);
    super.initState();
  }

  Future<void> _refreshWishList(bool isInit) {
    _wishlistScreenBloc.eventController.sink.add(RefreshWishList(true));
    setState(() {});
  }

  void _add_delete_ToListBorrow(int bookID) {
    _wishlistScreenBloc.eventController.sink
        .add(AddOrRemoveToListBorrow(bookID));
    setState(() {});
  }

  void _genQRCode(List<int> listBookID) {
    print(listBookID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<WishListScreenState>(
        initialData: _wishlistScreenBloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("Error");
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              _refreshWishList(false);
              return;
            },
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wish List',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${snapshot.data.listBorrow.length} of ${snapshot.data.wishlist.length}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
                for (Book book in snapshot.data.wishlist)
                  GestureDetector(
                    onTap: () {
                      this._add_delete_ToListBorrow(book.id);
                    },
                    child: BookItem(
                      book: book,
                      isTick: snapshot.data.listBorrow.contains(book.id),
                    ),
                  ),
                FlatButton(
                    onPressed: () => {_genQRCode(snapshot.data.listBorrow)},
                    child: Text('Gen QRcode')),
              ],
            ),
          );
        },
      ),
    );
  }
}
