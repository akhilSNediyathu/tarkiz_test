class Driver {
  final String firstName;
  final String lastName;
  final int driverId;
  final String profileImage;

  Driver({
    required this.firstName,
    required this.lastName,
    required this.driverId,
    required this.profileImage,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      firstName: json['firstName'],
      lastName: json['lastName'],
      driverId: json['driverId'],
      profileImage: json['profileImage'],
    );
  }
}