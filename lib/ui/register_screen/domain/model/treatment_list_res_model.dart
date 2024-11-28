// To parse this JSON data, do
//
//     final treatmentListResModel = treatmentListResModelFromJson(jsonString);

import 'dart:convert';

TreatmentListResModel treatmentListResModelFromJson(String str) => TreatmentListResModel.fromJson(json.decode(str));

String treatmentListResModelToJson(TreatmentListResModel data) => json.encode(data.toJson());

class TreatmentListResModel {
  final bool? status;
  final String? message;
  final List<Treatment>? treatments;

  TreatmentListResModel({
    this.status,
    this.message,
    this.treatments,
  });

  factory TreatmentListResModel.fromJson(Map<String, dynamic> json) => TreatmentListResModel(
    status: json["status"],
    message: json["message"],
    treatments: json["treatments"] == null ? [] : List<Treatment>.from(json["treatments"]!.map((x) => Treatment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "treatments": treatments == null ? [] : List<dynamic>.from(treatments!.map((x) => x.toJson())),
  };
}

class Treatment {
  final int? id;
  final List<Branch>? branches;
  final String? name;
  final String? duration;
  final String? price;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;

  Treatment({
    this.id,
    this.branches,
    this.name,
    this.duration,
    this.price,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Treatment.fromJson(Map<String, dynamic> json) => Treatment(
    id: json["id"],
    branches: json["branches"] == null ? [] : List<Branch>.from(json["branches"]!.map((x) => Branch.fromJson(x))),
    name: json["name"],
    duration: json["duration"],
    price: json["price"],
    isActive: json["is_active"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branches": branches == null ? [] : List<dynamic>.from(branches!.map((x) => x.toJson())),
    "name": name,
    "duration": duration,
    "price": price,
    "is_active": isActive,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Branch {
  final int? id;
  final String? name;
  final int? patientsCount;
  final String? location;
  final String? phone;
  final String? mail;
  final String? address;
  final String? gst;
  final bool? isActive;

  Branch({
    this.id,
    this.name,
    this.patientsCount,
    this.location,
    this.phone,
    this.mail,
    this.address,
    this.gst,
    this.isActive,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    name: json["name"],
    patientsCount: json["patients_count"],
    location: json["location"],
    phone: json["phone"],
    mail: json["mail"],
    address: json["address"],
    gst: json["gst"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "patients_count": patientsCount,
    "location": location,
    "phone": phone,
    "mail": mail,
    "address": address,
    "gst": gst,
    "is_active": isActive,
  };
}
