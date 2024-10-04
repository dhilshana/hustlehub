class CompanyModel {
  String? email;
  String? role;
  String? company;
  String? location;
  String? salary;
  String? jobLocation;
  String? jobType;
  String? experience;
  String? date;
  int? applicationCount;
  String? desc;
  CompanyModel(
      { this.email,
       this.role,
       this.company,
       this.location,
       this.salary,
       this.jobLocation,
       this.jobType,
       this.experience,
       this.applicationCount,
       this.date,
       this.desc});

       Map<String,dynamic> toMap(){ //tomap to store data to firestore
    return {
      'company':company,
      'email':email,
      'role':role,
      'location' :location,
      'salary':salary,
      'jobLocation':jobLocation,
      'jobType':jobType,
      'experience':experience,
      'applicationCount':applicationCount,
      'date':date,
      'desc':desc
    };
  }

  factory CompanyModel.fromMap(Map<String,dynamic> map){  //fetch data from firebase
    return CompanyModel(
      company: map['name'], 
      email: map['email'], 
      role:  map['role'],
      location: map['location'],
      salary: map['salary'],
      jobLocation: map['jobLocation'],
      jobType: map['jobType'],
      experience: map['experience'],
      applicationCount: map['applicationCount'],
      date: map['date'],
      desc: map['desc']
      );
  }

}
