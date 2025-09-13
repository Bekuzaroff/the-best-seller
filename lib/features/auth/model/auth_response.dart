import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';
@JsonSerializable()
class AuthResponse{
  final String status;
  final String data;
  const AuthResponse(
    {required this.status,
    required this.data}
  );
  
  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

  /// Connect the generated [_$AuthResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}