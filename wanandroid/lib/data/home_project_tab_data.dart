import 'package:json_annotation/json_annotation.dart';

part 'home_project_tab_data.g.dart';


@JsonSerializable()
class HomeProjectTabDataBean extends Object {

  @JsonKey(name: 'data')
  HomeProjectTabData data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomeProjectTabDataBean(this.data,this.errorCode,this.errorMsg,);

  factory HomeProjectTabDataBean.fromJson(Map<String, dynamic> srcJson) => _$HomeProjectTabDataBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeProjectTabDataBeanToJson(this);

}


@JsonSerializable()
class HomeProjectTabData extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<ProjectTabData> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  HomeProjectTabData(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory HomeProjectTabData.fromJson(Map<String, dynamic> srcJson) => _$HomeProjectTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeProjectTabDataToJson(this);

}


@JsonSerializable()
class ProjectTabData extends Object {

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
  List<Tags> tags;

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

  ProjectTabData(this.apkLink,this.author,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.origin,this.projectLink,this.publishTime,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory ProjectTabData.fromJson(Map<String, dynamic> srcJson) => _$ProjectTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectTabDataToJson(this);

}


@JsonSerializable()
class Tags extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  Tags(this.name,this.url,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

}