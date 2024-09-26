class userModel{
  String? name;
  String? email;
  String? number;
  String? password;
  String? confirmPassword;
  bool? terms;

  userModel({
    this.name,
    this.email,
    this.number,
    this.password,
    this.confirmPassword,
    this.terms,
  });


  Map<String, dynamic> tojson(){
    return {
      "name" : name,
      "email" : email,
      "number" : number,
      "password" : password,
      "confirmpassword" : confirmPassword,
      "terms" : terms
    };
  }
}