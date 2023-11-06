class User {
  String? userId;
  String? userName;
  String? userPhoneNumber;
  String? userImage;

  User({
    this.userId,
    this.userName,
    this.userPhoneNumber,
    this.userImage,
  });

  User.fromJson(Map<String, dynamic>json){
    userId = json["User Id"];
    userName = json["Name"];
    userPhoneNumber = json["Phone Number"];
    userImage = json["Image Url"];
  }

  Map<String, dynamic>?toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User Id"] = userId;
    data["Name"] = userName;
    data["Phone Number"] = userPhoneNumber;
    data["Image Url"] = userImage;
    return data;
  }
}