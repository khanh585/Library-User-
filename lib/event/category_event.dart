import 'package:user_library/dto/CategoryDTO.dart';

abstract class CategoryEvent {}

//
class FetchCategoryEvent extends CategoryEvent {
  // final List<CategoryDTO> categories;

  FetchCategoryEvent();
}
