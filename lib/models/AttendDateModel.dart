class AttendDateModel {
  String? date;
  String? id;
  String? sectionNumber;
  String? type;

  AttendDateModel({
    this.date,
    this.id,
    this.sectionNumber,
    this.type,
  });

  AttendDateModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    sectionNumber = json['section'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['id'] = id;
    data['section'] = sectionNumber;
    data['type'] = type;
    return data;
  }

  @override
  String toString() {
    return 'AttendDateModel{date: $date, id: $id, sectionNumber: $sectionNumber, type: $type}';
  }
}
