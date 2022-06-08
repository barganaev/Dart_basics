// import 'dart:convert';
//
// FetchData fetchDataFromJson(List<int> str) => FetchData.fromJson(json.decode(utf8.decode(str)));
//
// String fetchDataToJson(FetchData data) => json.encode(data.toJson());
//
// class FetchData {
//   FetchData({
//     this.artists,
//   });
//
//   final List<Artist> artists;
//
//   factory FetchData.fromJson(Map<String, dynamic> json) => FetchData(
//     artists: json["artists"] == null ? null : List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "artists": artists == null ? null : List<dynamic>.from(artists.map((x) => x.toJson())),
//   };
// }
//
// class Artist {
//   Artist({
//     this.name,
//     this.description,
//   });
//
//   final String name;
//   final String description;
//
//   factory Artist.fromJson(Map<String, dynamic> json) => Artist(
//     name: json["name"] == null ? null : json["name"],
//     description: json["description"] == null ? null : json["description"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name == null ? null : name,
//     "description": description == null ? null : description,
//   };
// }

class DataModel {
  String? name;
  String? description;

  DataModel({this.name, this.description});

  DataModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
  }
}