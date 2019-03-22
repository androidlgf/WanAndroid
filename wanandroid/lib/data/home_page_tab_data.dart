import 'package:json_annotation/json_annotation.dart';

part 'home_page_tab_data.g.dart';


@JsonSerializable()
class HomePageTabDataBean extends Object {

  @JsonKey(name: 'data')
  HomePageTabData data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomePageTabDataBean(this.data,this.errorCode,this.errorMsg,);

  factory HomePageTabDataBean.fromJson(Map<String, dynamic> srcJson) => _$HomePageTabDataBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomePageTabDataBeanToJson(this);

}


@JsonSerializable()
class HomePageTabData extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<PageTabData> datas;

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

  HomePageTabData(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory HomePageTabData.fromJson(Map<String, dynamic> srcJson) => _$HomePageTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomePageTabDataToJson(this);

}


@JsonSerializable()
class PageTabData extends Object {

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

  PageTabData(this.apkLink,this.author,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.origin,this.projectLink,this.publishTime,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory PageTabData.fromJson(Map<String, dynamic> srcJson) => _$PageTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PageTabDataToJson(this);

}


