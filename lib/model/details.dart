class Details {
  Details({required this.id, required this.userid, required this.title});

  final int id;
  final int userid;
  final String title;

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
        id: json["id"], userid: json["userId"], title: json["title"]);
  }
}
