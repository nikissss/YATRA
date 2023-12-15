// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class A_CountryModel {
  final String ACountry;
  A_CountryModel({
    required this.ACountry,
  });

  A_CountryModel copyWith({
    String? ACountry,
  }) {
    return A_CountryModel(
      ACountry: ACountry ?? this.ACountry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ACountry': ACountry,
    };
  }

  factory A_CountryModel.fromMap(Map<String, dynamic> map) {
    return A_CountryModel(
      ACountry: map['ACountry'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory A_CountryModel.fromJson(String source) => A_CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'A_CountryModel(ACountry: $ACountry)';

  @override
  bool operator ==(covariant A_CountryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.ACountry == ACountry;
  }

  @override
  int get hashCode => ACountry.hashCode;
}
