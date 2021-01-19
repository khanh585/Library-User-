abstract class LoginScreenEvent {}

//Login Success
class LoginLoading extends LoginScreenEvent {
  LoginLoading();
}

class FinishProcess extends LoginScreenEvent {
  FinishProcess();
}
