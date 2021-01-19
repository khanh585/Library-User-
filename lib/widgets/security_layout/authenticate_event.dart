abstract class AuthenticateEvent {}

//Login Success
class Connect extends AuthenticateEvent {
  var firebaseUser;
  Connect({this.firebaseUser});
}

class Disconnect extends AuthenticateEvent {
  Disconnect();
}
