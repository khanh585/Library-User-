import 'dart:async';
import '../event/remote_event.dart';
import '../state/remote_state.dart';

class RemoteBloc {
  var state = RemoteState(70); // khoi tao gia 70 cho remote state

  //tao 2 controller
  // 1 cai quan ly event, dam nhan nhiem vu nhan event tu UI
  final eventController = StreamController<RemoteEvent>();

  // 1 cai quan ly state, dam nhan nhiem vu truyen state den UI
  final stateController = StreamController<RemoteState>();

  RemoteBloc() {
    // lang nghe khi eventController push event moi
    eventController.stream.listen((event) {
      //thuong thi se tach ra ham rieng roi ten la mapEventToState
      //ham nay nhan event xu ly va cho ra output laf state

      if (event is IncrementEvent) {
        // tang am luong
        state = RemoteState(state.volume + event.increment);
      } else if (event is DecrementEvent) {
        //giam am luong
        state = RemoteState(state.volume - event.decrement);
      } else {
        // mute
        state = RemoteState(0);
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
