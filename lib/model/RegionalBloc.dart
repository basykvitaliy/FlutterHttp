class RegionalBloc {
    String acronym;
    String name;
    List<Object> otherAcronyms;
    List<Object> otherNames;

    RegionalBloc({this.acronym, this.name, this.otherAcronyms, this.otherNames});

    factory RegionalBloc.fromJson(Map<String, dynamic> json) {
        return RegionalBloc(
            acronym: json['acronym'], 
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['acronym'] = this.acronym;
        data['name'] = this.name;

        return data;
    }
}