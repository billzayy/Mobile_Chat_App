class GroupModel {
  GroupModel({
    this.idGroup,
    this.lastMessage,
    this.idMember,
    this.groupType,
    this.groupName,
    this.pictures,
  });

  GroupModel.fromJson(dynamic json) {
    idGroup = json['Id_Group'];
    lastMessage = json['Last_Message'];
    idMember = json['Id_Member'];
    groupType = json['GroupType'];
    groupName = json['GroupName'];
    pictures = json['Pictures'];
  }
  int? idGroup;
  int? lastMessage;
  String? idMember;
  String? groupType;
  String? groupName;
  String? pictures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_Group'] = idGroup;
    map['Last_Message'] = lastMessage;
    map['Id_Member'] = idMember;
    map['GroupType'] = groupType;
    map['GroupName'] = groupName;
    map['Pictures'] = pictures;
    return map;
  }
}
