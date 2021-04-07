abstract class ManageBorrowEvent {}

class FetchUser extends ManageBorrowEvent {
  FetchUser();
}

class FetchCustomers extends ManageBorrowEvent {
  final String name;

  FetchCustomers({this.name});
}

class CleanCustomers extends ManageBorrowEvent {
  CleanCustomers();
}