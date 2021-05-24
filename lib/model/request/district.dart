class District {
  final String idDistrict;
  final String name;
  final String idProvince;
  final String province;
  final String idCities;
  final String city;
  final String type;

  District({
    this.idDistrict,
    this.name,
    this.idCities,
    this.idProvince,
    this.province,
    this.city,
    this.type,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return new District(
      idDistrict: json['id_district'],
      name: json['name'],
      idProvince: json['id_province'],
      province: json['province'],
      idCities: json['id_cities'],
      city: json['city'],
      type: json['type'],
    );
  }
}
