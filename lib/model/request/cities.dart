class Cities {
  final String idCities;
  final String cityName;
  final String idProvince;
  final String province;
  final String type;
  final String postalCode;

  Cities(
      {this.idCities,
      this.cityName,
      this.idProvince,
      this.province,
      this.type,
      this.postalCode});

  factory Cities.fromJson(Map<String, dynamic> json) {
    return new Cities(
      idCities: json['id_cities'],
      cityName: json['city_name'],
      idProvince: json['id_province'],
      province: json['province'],
      type: json['type'],
      postalCode: json['postal_code'],
    );
  }
}
