import 'package:json_annotation/json_annotation.dart';

part 'serializable_banner_object.g.dart';

@JsonSerializable()
class SerializableBannerObject {
  SerializableBannerObject({
    this.errorCode,
    this.errorMsg,
    this.data
  });

  final int errorCode;
  final String errorMsg;
  final List<SerializableBannerDataObject>  data;
  factory SerializableBannerObject.fromJson(Map<String, dynamic> json) => _$SerializableBannerObjectFromJson(json);
}
@JsonSerializable()
class SerializableBannerDataObject{
  SerializableBannerDataObject(
      {this.desc,
        this.id,
        this.imagePath,
        this.isVisible,
        this.order,
        this.title,
        this.type,
        this.url});

  final String desc;
  final int id;
  final String imagePath;
  final int isVisible;
  final int order;
  final String title;
  final int type;
  String url;
  factory SerializableBannerDataObject.fromJson(Map<String, dynamic> json) => _$SerializableBannerDataObjectFromJson(json);
}

