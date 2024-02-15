// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      specialization: json['specialization'] as String?,
      qualification: json['qualification'] as String?,
      fees: json['fees'] as int?,
      workingHours: json['workingHours'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'specialization': instance.specialization,
      'qualification': instance.qualification,
      'fees': instance.fees,
      'workingHours': instance.workingHours,
      'isAvailable': instance.isAvailable,
      '__v': instance.v,
    };
