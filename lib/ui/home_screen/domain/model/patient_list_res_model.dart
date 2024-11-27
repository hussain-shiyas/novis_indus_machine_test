
import 'dart:convert';

PatientListResModel patientListResModelFromJson(String str) => PatientListResModel.fromJson(json.decode(str));

String patientListResModelToJson(PatientListResModel data) => json.encode(data.toJson());

class PatientListResModel {
  final bool? status;
  final String? message;
  final List<Patient>? patient;

  PatientListResModel({
    this.status,
    this.message,
    this.patient,
  });

  factory PatientListResModel.fromJson(Map<String, dynamic> json) => PatientListResModel(
    status: json["status"],
    message: json["message"],
    patient: json["patient"] == null ? [] : List<Patient>.from(json["patient"]!.map((x) => Patient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "patient": patient == null ? [] : List<dynamic>.from(patient!.map((x) => x.toJson())),
  };
}

class Patient {
  final int? id;
  final List<PatientDetailsSet>? patientDetailsSet;
  final Branch? branch;
  final String? user;
  final String? payment;
  final String? name;
  final String? phone;
  final String? address;
  final dynamic price;
  final int? totalAmount;
  final int? discountAmount;
  final int? advanceAmount;
  final int? balanceAmount;
  final String? dateNdTime;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;

  Patient({
    this.id,
    this.patientDetailsSet,
    this.branch,
    this.user,
    this.payment,
    this.name,
    this.phone,
    this.address,
    this.price,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    patientDetailsSet: json["patientdetails_set"] == null ? [] : List<PatientDetailsSet>.from(json["patientdetails_set"]!.map((x) => PatientDetailsSet.fromJson(x))),
    branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
    user: json["user"],
    payment: json["payment"],
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    price: json["price"],
    totalAmount: json["total_amount"],
    discountAmount: json["discount_amount"],
    advanceAmount: json["advance_amount"],
    balanceAmount: json["balance_amount"],
    dateNdTime: json["date_nd_time"],
    isActive: json["is_active"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patientdetails_set": patientDetailsSet == null ? [] : List<dynamic>.from(patientDetailsSet!.map((x) => x.toJson())),
    "branch": branch?.toJson(),
    "user": user,
    "payment": payment,
    "name": name,
    "phone": phone,
    "address": address,
    "price": price,
    "total_amount": totalAmount,
    "discount_amount": discountAmount,
    "advance_amount": advanceAmount,
    "balance_amount": balanceAmount,
    "date_nd_time": dateNdTime,
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

class PatientDetailsSet {
  final int? id;
  final String? male;
  final String? female;
  final int? patient;
  final int? treatment;
  final String? treatmentName;

  PatientDetailsSet({
    this.id,
    this.male,
    this.female,
    this.patient,
    this.treatment,
    this.treatmentName,
  });

  factory PatientDetailsSet.fromJson(Map<String, dynamic> json) => PatientDetailsSet(
    id: json["id"],
    male: json["male"],
    female: json["female"],
    patient: json["patient"],
    treatment: json["treatment"],
    treatmentName: json["treatment_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "male": male,
    "female": female,
    "patient": patient,
    "treatment": treatment,
    "treatment_name": treatmentName,
  };
}
