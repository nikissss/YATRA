// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:latlng/latlng.dart';

class FlightModel {
  final String id;
  final String name;
  final String price;
  final LatLng coordinates;
  final List<String> facilities;
  final String fullAddress; 
  final List<String> Refund;
  FlightModel({
    required this.id,
    required this.name,
    required this.price,
    this.coordinates = const LatLng(27.7209922,85.3330453),
    this.facilities = const [
      "Safety"
    ],
    this.fullAddress="Kathmandu",
    this.Refund= const[
      "Non-refundable",
      "Refundable",
      "Refundable",
      "Refundable",

     ],
    
  });

  FlightModel copyWith({
    String? id,
    String? name,
    String? price,
    LatLng? coordinates,
    List<String>? facilities,
    String? fullAddress,
    List<String>? Refund,
  }) {
    return FlightModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      coordinates: coordinates ?? this.coordinates,
      facilities: facilities ?? this.facilities,
      fullAddress: fullAddress ?? this.fullAddress,
      Refund: Refund ?? this.Refund,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'coordinates': coordinates,
      'facilities': facilities,
      'fullAddress': fullAddress,
      'Refund': Refund,
    };
  }

  factory FlightModel.fromMap(Map<String, dynamic> map) {
    return FlightModel(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      coordinates: map['coordinates'],
      facilities: List<String>.from((map['facilities'] as List<String>)),
      fullAddress: map['fullAddress'] as String,
      Refund: List<String>.from((map['Refund'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory FlightModel.fromJson(String source) => FlightModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FlightModel(id: $id, name: $name, price: $price, coordinates: $coordinates, facilities: $facilities, fullAddress: $fullAddress, Refund: $Refund)';
  }

  @override
  bool operator ==(covariant FlightModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.coordinates == coordinates &&
      listEquals(other.facilities, facilities) &&
      other.fullAddress == fullAddress &&
      listEquals(other.Refund, Refund);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      coordinates.hashCode ^
      facilities.hashCode ^
      fullAddress.hashCode ^
      Refund.hashCode;
  }
}
