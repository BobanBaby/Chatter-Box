// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralRequest _$GeneralRequestFromJson(Map<String, dynamic> json) {
  return GeneralRequest(
    userName: json['username'] as String,
    photoName: json['photo'] as String,
    password: json['password'] as String,
    branchCode: json['branch_code'] as String,
    egrn: json['egrn'] as String,
    tagId: json['tag_id'] as String,
    b64String: json['b64_string'] as String,
  );
}

Map<String, dynamic> _$GeneralRequestToJson(GeneralRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.userName);
  writeNotNull('password', instance.password);
  writeNotNull('branch_code', instance.branchCode);
  writeNotNull('egrn', instance.egrn);
  writeNotNull('tag_id', instance.tagId);
  writeNotNull('photo', instance.photoName);
  writeNotNull('b64_string', instance.b64String);
  return val;
}
