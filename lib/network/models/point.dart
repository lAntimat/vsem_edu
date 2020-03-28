class Point {
  String label;
  int value;
  String pointType;

  Point({this.label, this.value, this.pointType});

  Point.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
    pointType = json['point_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    data['point_type'] = this.pointType;
    return data;
  }
}