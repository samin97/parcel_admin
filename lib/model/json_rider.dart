class UserModel {
  final String address;
  final double lat;
  final double lng;
  final String phone;
  final String license;
  final String licenseImageUrl;
  final String riderEmail;
  final String riderName;
  final String riderUID;
  final String status;

  UserModel({
    required this.address,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.license,
    required this.licenseImageUrl,
    required this.riderEmail,
    required this.riderName,
    required this.riderUID,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      address: json['address'],
      lat: json['lat'],
      lng: json['lng'],
      phone: json['phone'],
      license: json['license no'],
      licenseImageUrl: json['licenseImageUrl'],
      riderEmail: json['riderEmail'],
      riderName: json['riderName'],
      riderUID: json['riderUID'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['lat'] = lat;
    data['lng'] = lng;
    data['phone'] = phone;
    data['license no'] = license;
    data['licenseImageUrl'] = licenseImageUrl;
    data['riderEmail'] = riderEmail;
    data['riderName'] = riderName;
    data['riderUID'] = riderUID;
    data['status'] = status;
    return data;
  }
}
