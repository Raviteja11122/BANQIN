class Office {
/*
{
  "id": 10,
  "name": "BBT",
  "nameDecorated": "....BBT",
  "externalId": "91",
  "openingDate": [
    2019
  ],
  "hierarchy": ".10.",
  "parentId": 1,
  "parentName": "Head Office Mysore"
}
*/

  late int id;
  late String name;
  late String nameDecorated;
  String? externalId;
  late List<int> openingDate;
  late String hierarchy;
  int? parentId;
  String? parentName;

  Office({
    required this.id,
    required this.name,
    required this.nameDecorated,
    this.externalId,
    required this.openingDate,
    required this.hierarchy,
    this.parentId,
    this.parentName,
  });

  Office.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    name = json['name'].toString();
    nameDecorated = json['nameDecorated'].toString();
    externalId = json['externalId']?.toString();
    if (json['openingDate'] != null) {
      final v = json['openingDate'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      openingDate = arr0;
    }
    hierarchy = json['hierarchy'].toString();
    parentId = json['parentId']?.toInt();
    parentName = json['parentName']?.toString();

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameDecorated'] = nameDecorated;
    data['externalId'] = externalId;
    if (openingDate != null) {
      final v = openingDate;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['openingDate'] = arr0;
    }
    data['hierarchy'] = hierarchy;
    data['parentId'] = parentId;
    data['parentName'] = parentName;
    return data;
  }
}
