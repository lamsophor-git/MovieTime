import 'package:meta/meta.dart';
import 'dart:convert';

class Account {
  Account({
    @required this.avatar,
    @required this.id,
    @required this.iso6391,
    @required this.iso31661,
    @required this.name,
    @required this.includeAdult,
    @required this.username,
  });

  Avatar avatar;
  int id;
  String iso6391;
  String iso31661;
  String name;
  bool includeAdult;
  String username;

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        avatar: json["avatar"] == null ? null : Avatar.fromMap(json["avatar"]),
        id: json["id"] == null ? null : json["id"],
        iso6391: json["iso_639_1"] == null ? null : json["iso_639_1"],
        iso31661: json["iso_3166_1"] == null ? null : json["iso_3166_1"],
        name: json["name"] == null ? null : json["name"],
        includeAdult:
            json["include_adult"] == null ? null : json["include_adult"],
        username: json["username"] == null ? null : json["username"],
      );

  Map<String, dynamic> toMap() => {
        "avatar": avatar == null ? null : avatar.toMap(),
        "id": id == null ? null : id,
        "iso_639_1": iso6391 == null ? null : iso6391,
        "iso_3166_1": iso31661 == null ? null : iso31661,
        "name": name == null ? null : name,
        "include_adult": includeAdult == null ? null : includeAdult,
        "username": username == null ? null : username,
      };
}

class Avatar {
  Avatar({
    @required this.gravatar,
  });

  Gravatar gravatar;

  factory Avatar.fromJson(String str) => Avatar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Avatar.fromMap(Map<String, dynamic> json) => Avatar(
        gravatar: json["gravatar"] == null
            ? null
            : Gravatar.fromMap(json["gravatar"]),
      );

  Map<String, dynamic> toMap() => {
        "gravatar": gravatar == null ? null : gravatar.toMap(),
      };
}

class Gravatar {
  Gravatar({
    @required this.hash,
  });

  String hash;

  factory Gravatar.fromJson(String str) => Gravatar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gravatar.fromMap(Map<String, dynamic> json) => Gravatar(
        hash: json["hash"] == null ? null : json["hash"],
      );

  Map<String, dynamic> toMap() => {
        "hash": hash == null ? null : hash,
      };
}
