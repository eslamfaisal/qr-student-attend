class SubjectModel {
  String? id;
  String? name;

  SubjectModel({
    this.id,
    this.name,
  });

  SubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

}
