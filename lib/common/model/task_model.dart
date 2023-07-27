
class Task {
  int? id;
  String? title;
  String? description;
  int? isCompleted;
  String? date;
  String? starttime;
  String? endtime;
  int? remind;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.date,
    this.starttime,
    this.endtime,
    this.remind,
    this.repeat,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    isCompleted: json["isCompleted"],
    date: json["date"],
    starttime: json["starttime"],
    endtime: json["endtime"],
    remind: json["remind"],
    repeat: json["repeat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "isCompleted": isCompleted,
    "date": date,
    "starttime": starttime,
    "endtime": endtime,
    "remind": remind,
    "repeat": repeat,
  };
}

