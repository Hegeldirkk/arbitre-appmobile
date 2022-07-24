import 'package:firebase_auth/firebase_auth.dart';

class Arbitre {
  String? id;
  String? userId;
  String? email;
  String? role;
  int? completed;
  String? grade;
  String? name;
  String? number;
  String? promotion;
  String? created_at;

  Arbitre({this.id, this.email, this.name, this.completed, this.created_at,  this.grade, this.number, this.promotion, this.role, this.userId});

  factory Arbitre.fromJson(Map<String, dynamic> json)
  =>  Arbitre(
    id: json['id'],
    userId: json['userId'],
    email: json['email'],
    name: json['name'],
    completed: json['complete'],
    created_at: json['created_at'],
    grade: json['grade'],
    promotion: json['promotion'],
    number: json['number'],
    role: json['role'],
  );


}