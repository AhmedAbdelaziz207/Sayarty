import 'package:freezed_annotation/freezed_annotation.dart';
part 'userData.g.dart';
@JsonSerializable()
class UserData {
  final String? token;
  final int? id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'device_token')
  final String? deviceToken;
  @JsonKey(name: 'photo')
  final String? photo;
  @JsonKey(name: 'email_verified_at')
  final bool? emailVerifiedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  UserData({
    this.token,
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.latitude,
    this.longitude,
    this.deviceToken,
    this.photo,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}