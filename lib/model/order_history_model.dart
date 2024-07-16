class OrderSummary {
  final int statusCode;
  final OrderData data;
  final String? message;

  OrderSummary({
    required this.statusCode,
    required this.data,
    this.message,
  });

  factory OrderSummary.fromJson(Map<String, dynamic> json) {
    return OrderSummary(
      statusCode: json['statusCode'],
      data: OrderData.fromJson(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class OrderData {
  final int totalOrderCount;
  final int pendingOrderCount;
  final int completedOrderCount;
  final int otherOrderCount;
  final int cashCount;
  final double sumOfCash;

  OrderData({
    required this.totalOrderCount,
    required this.pendingOrderCount,
    required this.completedOrderCount,
    required this.otherOrderCount,
    required this.cashCount,
    required this.sumOfCash,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      totalOrderCount: json['totalOrderCount'],
      pendingOrderCount: json['pendingOrderCount'],
      completedOrderCount: json['completedOrderCount'],
      otherOrderCount: json['otherOrderCount'],
      cashCount: json['cashCount'],
      sumOfCash: json['sumOfCash'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalOrderCount': totalOrderCount,
      'pendingOrderCount': pendingOrderCount,
      'completedOrderCount': completedOrderCount,
      'otherOrderCount': otherOrderCount,
      'cashCount': cashCount,
      'sumOfCash': sumOfCash,
    };
  }
}