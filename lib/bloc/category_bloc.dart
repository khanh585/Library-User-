import 'dart:async';
import 'package:user_library/dao/CategoryDAO.dart';
import 'package:user_library/dto/CategoryDTO.dart';
import 'package:user_library/event/category_event.dart';
import 'package:user_library/state/categoty_state.dart';

class CategoryBloc {
  var state = CategoryState(List()); // khoi tao gia 70 cho remote state

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<CategoryEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<CategoryState>();

  CategoryBloc() {
    eventController.stream.listen((event) {
      if (event is FetchCategoryEvent) {
        List<CategoryDTO> list =
            CategoryDAO().fetchCategory('') as List<CategoryDTO>;
        state = CategoryState(list);
      }

      stateController.sink.add(state);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
