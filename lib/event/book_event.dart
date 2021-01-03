abstract class BookEvent {}

//
class FetchBookEvent extends BookEvent {
  // final List<CategoryDTO> categories;
  final String txtName;
  final String txtAuthor;
  final int categoryID;

  FetchBookEvent(this.txtName, this.txtAuthor, this.categoryID);
}

// class SearchBookByNameEvent extends BookEvent {
//   SearchBookByNameEvent(this.txtSearch);
// }

// class SearchBookByAuthorEvent extends BookEvent {
//   SearchBookByAuthorEvent(this.txtSearch);
// }

// class SearchBookByCategoryEvent extends BookEvent {

//   SearchBookByCategoryEvent(this.categoryID);
// }
