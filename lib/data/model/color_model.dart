import 'package:flutter/material.dart';

class GradientModel{
  final String id;
  final List gradient;

  GradientModel({
     required this.id,
     required this.gradient,
  });

  factory GradientModel.fromJson(Map<String, dynamic> json){
    return GradientModel(
        id: json['id']  as String, 
        gradient: json['gradient'], 
        );
  }

  Map<String, dynamic> toJson() => {
        'id':id,
        'gradient':gradient,
      };
}