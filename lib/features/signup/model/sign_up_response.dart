import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';
@JsonSerializable()
class SignUpResponse{
  final String status;
  final String data;
  const SignUpResponse(
    {required this.status,
    required this.data}
  );
  
  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);

  /// Connect the generated [_$SignUpResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}