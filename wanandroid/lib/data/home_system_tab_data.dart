import 'package:json_annotation/json_annotation.dart';

part 'home_system_tab_data.g.dart';


@JsonSerializable()
class HomeSystemTabDataBean extends Object {

  @JsonKey(name: 'data')
  List<SystemTabData> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomeSystemTabDataBean(this.data,this.errorCode,this.errorMsg,);

  factory HomeSystemTabDataBean.fromJson(Map<String, dynamic> srcJson) => _$HomeSystemTabDataBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeSystemTabDataBeanToJson(this);

}


@JsonSerializable()
class SystemTabData extends Object {

  @JsonKey(name: 'children')
  List<Children> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  SystemTabData(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory SystemTabData.fromJson(Map<String, dynamic> srcJson) => _$SystemTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SystemTabDataToJson(this);

}


@JsonSerializable()
class Children extends Object {

  @JsonKey(name: 'children')
  List<dynamic> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  Children(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory Children.fromJson(Map<String, dynamic> srcJson) => _$ChildrenFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);

}