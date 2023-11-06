class Admin {
  String? userId;
  String? userName;
  String? userPhoneNumber;
  String? userImage;

  Admin({
    this.userId,
    this.userName,
    this.userPhoneNumber,
    this.userImage,
  });

  Admin.fromJson(Map<String, dynamic>json){
    userId = json["Admin Id"];
    userName = json["Name"];
    userPhoneNumber = json["Phone Number"];
    userImage = json["Image Url"];
  }

  Map<String, dynamic>?toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Admin Id"] = userId;
    data["Name"] = userName;
    data["Phone Number"] = userPhoneNumber;
    data["Image Url"] = userImage;
    return data;
  }
}