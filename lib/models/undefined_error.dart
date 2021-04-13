class UndefinedError {
  int id;
  int drawerDetectionId;
  String errorMessage;
  bool isConfirm;
  bool isRejected;
  int typeError;

  UndefinedError(
      {this.id,
      this.drawerDetectionId,
      this.errorMessage,
      this.isConfirm,
      this.isRejected,
      this.typeError});

  UndefinedError.customerID({
    this.id,
    this.drawerDetectionId,
    this.errorMessage,
    this.isConfirm,
    this.isRejected,
    this.typeError,
  });

  factory UndefinedError.fromJson(Map<String, dynamic> json) {
    return UndefinedError(
        id: json['id'],
        drawerDetectionId: json['drawerDetectionId'],
        errorMessage: json['errorMessage'],
        isConfirm: json['isConfirm'],
        isRejected: json['isRejected'],
        typeError: json['typeError']);
  }

  Map<String, dynamic> toJson() => {
        // 'id': feedbackID,
        'id': id,
        'drawerDetectionId': drawerDetectionId,
        'errorMessage': errorMessage,
        'isConfirm': isConfirm,
        'isRejected': isRejected,
        'typeError': typeError
      };
}
