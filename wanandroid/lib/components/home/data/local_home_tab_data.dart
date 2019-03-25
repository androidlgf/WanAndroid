import 'package:json_annotation/json_annotation.dart';

part 'local_home_tab_data.g.dart';

//flutter packages pub run build_runner build/
List<LocalHomeTab> getLocalHomeTabList(List<dynamic> list){
  List<LocalHomeTab> result = [];
  list.forEach((item){
    result.add(LocalHomeTab.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class LocalHomeTab extends Object {

  @JsonKey(name: 'tab')
  String tab;

  @JsonKey(name: 'id')
  int id;

  LocalHomeTab(this.tab,this.id,);

  factory LocalHomeTab.fromJson(Map<String, dynamic> srcJson) => _$LocalHomeTabFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocalHomeTabToJson(this);

}