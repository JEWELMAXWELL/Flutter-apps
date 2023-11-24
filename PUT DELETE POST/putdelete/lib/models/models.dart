import 'dart:convert';



List<Models> userFromJson(String str) => List<Models>.from(json.decode(str).map((x) => Models.fromJson(x)));



String userToJson(List<Models> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class Models {

  Models({

    this.createdAt,

    this.name,

    this.avatar,

    this.id,

    this.qualifications,

  });



  DateTime? createdAt;

  String? name;

  String? avatar;

  String? id;

  List<Qualification>? qualifications;



  factory   Models.fromJson(Map<String, dynamic> json) => Models(

        createdAt: DateTime.parse(json["createdAt"]),

        name: json["name"],

        avatar: json["avatar"],

        id: json["id"],

        qualifications: json["qualifications"] != null

            ? List<Qualification>.from(json["qualifications"].map((x) => Qualification.fromJson(x)))

            : [],

      );



  Map<String, dynamic> toJson() => {

        "name": name,

        "qualifications": qualifications != null ? List<dynamic>.from(qualifications!.map((x) => x.toJson())) : [],

      };

}



class Qualification {

  Qualification({

    this.degree,

    this.completionData,

  });



  String? degree;

  String? completionData;



  factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(

        degree: json["degree"],

        completionData: json["completionData"],

      );



  Map<String, dynamic> toJson() => {

        "degree": degree,

        "completionData": completionData,

      };

}




// import 'dart:convert';

// List<Models> modelsFromJson(String str) => List<Models>.from(json.decode(str).map((x) => Models.fromJson(x)));

// String modelsToJson(List<Models> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Models {
//     DateTime ?createdAt;
//     String ?name;
//     String ?avatar;
//     String ?id;
//     List<Qualification> ?qualifications;

//     Models({
//          this.createdAt,
//          this.name,
//         this.avatar,
//          this.id,
//         this.qualifications,
//     });

//     factory Models.fromJson(Map<String, dynamic> json) => Models(
//         createdAt: DateTime.parse(json["createdAt"]),
//         name: json["name"],
//         avatar: json["avatar"],
//         id: json["id"],
//         qualifications: json["qualifications"]!=null
//         ? List<Qualification>.from(json["qualifications"].map((x) => Qualification.fromJson(x))):[],
//     );

//     Map<String, dynamic> toJson() => {
//         // "createdAt": createdAt.toIso8601String(),
//         "name": name,
//         // "avatar": avatar,
//         // "id": id,
//         "qualifications":qualifications!=null ?List<dynamic>.from(qualifications!.map((x) => x.toJson())):[],
//     };
// }

// class Qualification {
//     String degree;
//     String completionData;

//     Qualification({
//         required this.degree,
//         required this.completionData,
//     });

//     factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
//         degree: json["degree"],
//         completionData: json["completionData"],
//     );

//     Map<String, dynamic> toJson() => {
//         "degree": degree,
//         "completionData": completionData,
//     };
// }
