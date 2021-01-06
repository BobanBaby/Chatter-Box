import 'package:json_annotation/json_annotation.dart';

part 'general_request.g.dart';

@JsonSerializable()
class GeneralRequest {
  @JsonKey(includeIfNull: false, name: "username")
  final String userName;
  @JsonKey(includeIfNull: false, name: "password")
  final String password;
  @JsonKey(includeIfNull: false, name: "branch_code")
  final String branchCode;
  @JsonKey(includeIfNull: false, name: "egrn")
  final String egrn;
  @JsonKey(includeIfNull: false, name: "tag_id")
  String tagId;
  @JsonKey(includeIfNull: false, name: "photo")
  String photoName;
  @JsonKey(includeIfNull: false, name: "b64_string")
  String b64String;

  GeneralRequest(
      {this.userName,
      this.photoName,
      this.password,
      this.branchCode,
      this.egrn,
      this.tagId,
      this.b64String});

  factory GeneralRequest.fromJson(Map<String, dynamic> json) =>
      _$GeneralRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralRequestToJson(this);
}
