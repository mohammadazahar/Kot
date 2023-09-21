// To parse this JSON data, do
//
//     final groupTopics = groupTopicsFromJson(jsonString);

import 'dart:convert';

GroupTopics groupTopicsFromJson(String str) =>
    GroupTopics.fromJson(json.decode(str));

String groupTopicsToJson(GroupTopics data) => json.encode(data.toJson());

class GroupTopics {
  List<Datum>? data;
  String? message;
  int? total;

  GroupTopics({
    this.data,
    this.message,
    this.total,
  });

  factory GroupTopics.fromJson(Map<String, dynamic> json) => GroupTopics(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "total": total,
      };
}

class Datum {
  Empty? empty;
  bool? isNew;
  Doc? doc;
  List<Doc>? communityTopics;

  Datum({
    this.empty,
    this.isNew,
    this.doc,
    this.communityTopics,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        empty: Empty.fromJson(json["\u0024__"]),
        isNew: json["\u0024isNew"],
        doc: Doc.fromJson(json["_doc"]),
        communityTopics:
            List<Doc>.from(json["communityTopics"].map((x) => Doc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\u0024__": empty!.toJson(),
        "\u0024isNew": isNew,
        "_doc": doc!.toJson(),
        "communityTopics":
            List<dynamic>.from(communityTopics!.map((x) => x.toJson())),
      };
}

class Doc {
  String? id;
  String? name;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? category;

  Doc({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.category,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "category": category,
      };
}

class Empty {
  ActivePaths? activePaths;
  bool? skipId;

  Empty({
    this.activePaths,
    this.skipId,
  });

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        activePaths: ActivePaths.fromJson(json["activePaths"]),
        skipId: json["skipId"],
      );

  Map<String, dynamic> toJson() => {
        "activePaths": activePaths!.toJson(),
        "skipId": skipId,
      };
}

class ActivePaths {
  Paths? paths;
  States? states;

  ActivePaths({
    this.paths,
    this.states,
  });

  factory ActivePaths.fromJson(Map<String, dynamic> json) => ActivePaths(
        paths: Paths.fromJson(json["paths"]),
        states: States.fromJson(json["states"]),
      );

  Map<String, dynamic> toJson() => {
        "paths": paths!.toJson(),
        "states": states!.toJson(),
      };
}

class Paths {
  String? name;
  String? description;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? v;

  Paths({
    this.name,
    this.description,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Paths.fromJson(Map<String, dynamic> json) => Paths(
        name: json["name"],
        description: json["description"],
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class States {
  Default? require;
  Default? statesDefault;
  Init? init;

  States({
    this.require,
    this.statesDefault,
    this.init,
  });

  factory States.fromJson(Map<String, dynamic> json) => States(
        require: Default.fromJson(json["require"]),
        statesDefault: Default.fromJson(json["default"]),
        init: Init.fromJson(json["init"]),
      );

  Map<String, dynamic> toJson() => {
        "require": require!.toJson(),
        "default": statesDefault!.toJson(),
        "init": init!.toJson(),
      };
}

class Init {
  bool? id;
  bool? name;
  bool? description;
  bool? createdAt;
  bool? updatedAt;
  bool? v;

  Init({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Init.fromJson(Map<String, dynamic> json) => Init(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class Default {
  Default();

  factory Default.fromJson(Map<String, dynamic> json) => Default();

  Map<String, dynamic> toJson() => {};
}
