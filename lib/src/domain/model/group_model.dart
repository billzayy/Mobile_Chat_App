import 'package:software_project_3/src/domain/model/user_model.dart';

class GroupModel {
  GroupModel({
    this.idGroup,
    // this.lastMessage,
    this.idMember,
    this.groupType,
    this.groupName,
    this.pictures,
  });

  GroupModel.fromJson(dynamic json) {
    idGroup = json['Id_Group'];
    // lastMessage = json['Last_Message'];
    if (json['Id_Member'] != null) {
      idMember = [];
      json['Id_Member'].forEach((v) {
        idMember?.add(UserModel.fromJson(v));
      });
    }
    groupType = json['GroupType'];
    groupName = json['GroupName'];
    pictures = json['Pictures'];
  }
  int? idGroup;
  // int? lastMessage;
  List<UserModel>? idMember;
  String? groupType;
  String? groupName;
  String? pictures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_Group'] = idGroup;
    // map['Last_Message'] = lastMessage;
    if (idMember != null) {
      map['Id_Member'] = idMember?.map((v) => v.toJson()).toList();
    }
    map['GroupType'] = groupType;
    map['GroupName'] = groupName;
    map['Pictures'] = pictures;
    return map;
  }
}
