class AttendModel {
  String? attendType;
  String? id;
  String? sectionId;
  String? sectionNumber;
  String? subjectId;
  String? subjectName;
  String? userId;
  String? userName;
  String? date;

  AttendModel(
      {this.attendType,
        this.id,
        this.sectionId,
        this.sectionNumber,
        this.subjectId,
        this.subjectName,
        this.userId,
        this.userName,
        this.date});

  AttendModel.fromJson(Map<String, dynamic> json) {
    attendType = json['attend_type'];
    id = json['id'];
    sectionId = json['section_id'];
    sectionNumber = json['section_number'];
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
    userId = json['user_id'];
    userName = json['user_name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attend_type'] = this.attendType;
    data['id'] = this.id;
    data['section_id'] = this.sectionId;
    data['section_number'] = this.sectionNumber;
    data['subject_id'] = this.subjectId;
    data['subject_name'] = this.subjectName;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['date'] = this.date;
    return data;
  }
}
