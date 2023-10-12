class Modelclass {
  String? title;
  String? desc;

  Modelclass({this.title, this.desc});

  Modelclass.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    desc = json["desc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["desc"] = desc;
    return _data;
  }
}
