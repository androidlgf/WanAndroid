import 'package:json_annotation/json_annotation.dart';

part 'home_navigation_tab_data.g.dart';


@JsonSerializable()
class HomeNavigationTabDataBean extends Object {

  @JsonKey(name: 'data')
  List<NavigationTabData> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomeNavigationTabDataBean(this.data,this.errorCode,this.errorMsg,);

  factory HomeNavigationTabDataBean.fromJson(Map<String, dynamic> srcJson) => _$HomeNavigationTabDataBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeNavigationTabDataBeanToJson(this);

}


@JsonSerializable()
class NavigationTabData extends Object {

  @JsonKey(name: 'articles')
  List<Articles> articles;

  @JsonKey(name: 'cid')
  int cid;

  @JsonKey(name: 'name')
  String name;

  NavigationTabData(this.articles,this.cid,this.name,);

  factory NavigationTabData.fromJson(Map<String, dynamic> srcJson) => _$NavigationTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NavigationTabDataToJson(this);

}


@JsonSerializable()
class Articles extends Object {

  @JsonKey(name: 'apkLink')
  String apkLink;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'fresh')
  bool fresh;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'projectLink')
  String projectLink;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'superChapterId')
  int superChapterId;

  @JsonKey(name: 'superChapterName')
  String superChapterName;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  Articles(this.apkLink,this.author,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.origin,this.projectLink,this.publishTime,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory Articles.fromJson(Map<String, dynamic> srcJson) => _$ArticlesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

}