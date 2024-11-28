// To parse this JSON data, do
//
//     final registerReqModel = registerReqModelFromJson(jsonString);

import 'dart:convert';

RegisterReqModel registerReqModelFromJson(String str) => RegisterReqModel.fromJson(json.decode(str));

String registerReqModelToJson(RegisterReqModel data) => json.encode(data.toJson());

class RegisterReqModel {
  final String? name;
  final String? executive;
  final String? payment;
  final String? phone;
  final String? address;
  final int? totalAmount;
  final int? discountAmount;
  final int? advanceAmount;
  final int? balanceAmount;
  final String? dateNdTime;
  final String? id;
  final String? male;
  final String? female;
  final String? branch;
  final String? treatments;

  RegisterReqModel({
    this.name,
    this.executive,
    this.payment,
    this.phone,
    this.address,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.id,
    this.male,
    this.female,
    this.branch,
    this.treatments,
  });

  factory RegisterReqModel.fromJson(Map<String, dynamic> json) => RegisterReqModel(
    name: json["name"],
    executive: json["executive"],
    payment: json["payment"],
    phone: json["phone"],
    address: json["address"],
    totalAmount: json["total_amount"],
    discountAmount: json["discount_amount"],
    advanceAmount: json["advance_amount"],
    balanceAmount: json["balance_amount"],
    dateNdTime: json["date_nd_time"],
    id: json["id"],
    male: json["male"],
    female: json["female"],
    branch: json["branch"],
    treatments: json["treatments"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "executive": executive,
    "payment": payment,
    "phone": phone,
    "address": address,
    "total_amount": totalAmount,
    "discount_amount": discountAmount,
    "advance_amount": advanceAmount,
    "balance_amount": balanceAmount,
    "date_nd_time": dateNdTime,
    "id": id,
    "male": male,
    "female": female,
    "branch": branch,
    "treatments": treatments,
  };
}
