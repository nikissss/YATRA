// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class D_CountryModel {
  final String Dcountry;
  D_CountryModel({
    required this.Dcountry,
  });

  D_CountryModel copyWith({
    String? Dcountry,
  }) {
    return D_CountryModel(
      Dcountry: Dcountry ?? this.Dcountry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Dcountry': Dcountry,
    };
  }

  factory D_CountryModel.fromMap(Map<String, dynamic> map) {
    return D_CountryModel(
      Dcountry: map['Dcountry'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory D_CountryModel.fromJson(String source) => D_CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'D_CountryModel(Dcountry: $Dcountry)';

  @override
  bool operator ==(covariant D_CountryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.Dcountry == Dcountry;
  }

  @override
  int get hashCode => Dcountry.hashCode;
}
