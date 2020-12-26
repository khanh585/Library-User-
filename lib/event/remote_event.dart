abstract class RemoteEvent {}

// event tăng âm lượng, user muốn tăng bao nhiều thì truyền vào biến increment
class IncrementEvent extends RemoteEvent {
  final int increment;
  IncrementEvent(this.increment);
}

// event giảm âm lượng, user muốn giảm bao nhiêu thì truyền vào biến decrement
class DecrementEvent extends RemoteEvent {
  DecrementEvent(this.decrement);

  final int decrement;
}

// event mute
class MuteEvent extends RemoteEvent {}
