
class UndefinedError {
  int id;
  int drawerDetectionId;
  String errorMessage;
  bool isConfirm;
  int typeError;

  UndefinedError(
      {this.id,
      this.drawerDetectionId,
      this.errorMessage,
      this.isConfirm,
      this.typeError});

  UndefinedError.customerID(
      {this.id,this.drawerDetectionId, this.errorMessage,this.isConfirm,this.typeError});

  factory UndefinedError.fromJson(Map<String, dynamic> json) {
    return UndefinedError(
      id: json['id'],
      drawerDetectionId: json['drawerDetectionId'],
      errorMessage:json['errorMessage'],
      isConfirm: json['isConfirm'],
      typeError: json['typeError']
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id' : id,
        'drawerDetectionId': drawerDetectionId,
        'errorMessage': errorMessage,
        'isConfirm': isConfirm,
        'typeError': typeError
      };
}
