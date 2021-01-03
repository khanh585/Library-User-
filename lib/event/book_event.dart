abstract class BookEvent {}

//
class FetchBookEvent extends BookEvent {
  // final List<CategoryDTO> categories;
  final String txtName;
  final String txtAuthor;
  final int categoryID;

  FetchBookEvent(this.txtName, this.txtAuthor, this.categoryID);
}
