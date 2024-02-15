import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? imageUrl;
  String? specialization;
  String? qualification;
  int? fees;
  String? workingHours;
  bool? isAvailable;
  @JsonKey(name: '__v')
  int? v;

  DoctorModel({
    this.id,
    this.name,
    this.imageUrl,
    this.specialization,
    this.qualification,
    this.fees,
    this.workingHours,
    this.isAvailable,
    this.v,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return _$DoctorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
