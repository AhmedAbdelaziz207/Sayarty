// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  token: json['token'] as String?,
  id: (json['id'] as num?)?.toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  phone: json['phone'] as String?,
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
  deviceToken: json['device_token'] as String?,
  photo: json['photo'] as String?,
  emailVerifiedAt: json['email_verified_at'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'token': instance.token,
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'device_token': instance.deviceToken,
  'photo': instance.photo,
  'email_verified_at': instance.emailVerifiedAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
