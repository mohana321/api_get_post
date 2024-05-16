class universe {
   List<String>? webPages;
  String? alphaTwoCode;
  //Null? stateProvince;
   List<String>? domains;
  //String? name;
  String? country;

  universe(
      {
         this.webPages,
        this.alphaTwoCode,
        //this.stateProvince,
         this.domains,
        //this.name,
        this.country});

  universe.fromJson(Map<String, dynamic> json) {
     webPages = json['web_pages'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
   //stateProvince = json['state-province'];
     domains = json['domains'].cast<String>();
    //name = json['name'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
     data['web_pages'] = this.webPages;
    data['alpha_two_code'] = this.alphaTwoCode;
    //data['state-province'] = this.stateProvince;
     data['domains'] = this.domains;
    //data['name'] = this.name;
    data['country'] = this.country;
    return data;
  }
}
