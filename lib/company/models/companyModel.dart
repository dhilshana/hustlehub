import 'package:flutter/foundation.dart';

class CompanyModel {
  String? email;
  String? role;
  String? company;
  String? finalSalary;
  String? jobLocation;
  String? jobType;
  int? experience;
  String? date;
  int? applicationCount;
  List<String>? desc;
  String? oppurtunityType;
  String? skills;
  String? jobTime;
  int? openingsCount;
  String? currency;
  String? initialSalary;
  List<String>? prefrence;
  List<String>? perks;
  
  CompanyModel(
      { this.email,
       this.role,
       this.company,
       this.finalSalary,
       this.jobLocation,
       this.jobType,
       this.experience,
       this.applicationCount,
       this.date,
       this.desc,
       this.oppurtunityType,
       this.skills,
       this.jobTime,
       this.openingsCount,
       this.currency,
       this.initialSalary,
       this.prefrence,
       this.perks,
    
    });

       Map<String,dynamic> toMap(){ //tomap to store data to firestore
    return {
      if (company != null)'company':company,
       if (email != null) 'email' : email,
      'role':role,
      'finalsalary':finalSalary,
      'jobLocation':jobLocation,
      'jobType':jobType,
      'experience':experience,
      'applicationCount':applicationCount,
      'date':date,
      'desc':desc,
      'oppurtunityType':oppurtunityType,
      'skills':skills,
      'jobTime':jobTime,
      'openingsCount':openingsCount,
      'currency':currency,
      'initialSalary':initialSalary,
      'preference':prefrence,
      'perks':perks,


  
  
    };
  }

  factory CompanyModel.fromMap(Map<String,dynamic> map){  //fetch data from firebase
    return CompanyModel(
      company: map['name'], 
      email: map['email'], 
      role:  map['role'],
      finalSalary: map['finalSalary'],
      jobLocation: map['jobLocation'],
      jobType: map['jobType'],
      experience: map['experience'],
      applicationCount: map['applicationCount'],
      date: map['date'],
      desc: map['desc'],
      oppurtunityType: map['oppurtunityType'],
      skills: map['skills'],
      jobTime: map['jobTime'],
      openingsCount: map['openingsCount'],
      currency: map['currency'],
      initialSalary: map['initialSalary'],
      prefrence: map['preference'],
      perks: map['perks'],
      

      );
  }

}
