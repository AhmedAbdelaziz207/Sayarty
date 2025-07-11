import 'package:freezed_annotation/freezed_annotation.dart';
import '../ui/userData.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int? status;
  final String? message;
  final UserData? data;

  LoginResponse({this.status, this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}



/*
"id": 2,
        "first_name": "mister",
        "last_name": "x",
        "phone": "0193214123",
        "latitude": "41.1432423",
        "longitude": "32.4134234",
        "device_token": "sdfsdf43t3g2f2t34",
        "photo": null,
        "email_verified_at": null,
        "created_at": "2025-07-11T12:57:17.000000Z",
        "updated_at": "2025-07-11T12:57:17.000000Z",
        "token": "5|8ezVTlgvCBD2y6GdhoaoQ9r2nHdRjvpyj4iE4TxG4b1390f7"
 */
