// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_banner_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerializableBannerObject _$SerializableBannerObjectFromJson(
    Map<String, dynamic> json) {
  return SerializableBannerObject(
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : SerializableBannerDataObject.fromJson(
                  e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SerializableBannerObjectToJson(
        SerializableBannerObject instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

SerializableBannerDataObject _$SerializableBannerDataObjectFromJson(
    Map<String, dynamic> json) {
  return SerializableBannerDataObject(
      desc: json['desc'] as String,
      id: json['id'] as int,
      imagePath: json['imagePath'] as String,
      isVisible: json['isVisible'] as int,
      order: json['order'] as int,
      title: json['title'] as String,
      type: json['type'] as int,
      url: json['url'] as String);
}

Map<String, dynamic> _$SerializableBannerDataObjectToJson(
        SerializableBannerDataObject instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url
    };
