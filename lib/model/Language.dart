class Language {
    String iso639_1;
    String iso639_2;
    String name;
    String nativeName;

    Language({this.iso639_1, this.iso639_2, this.name, this.nativeName});

    factory Language.fromJson(Map<String, dynamic> json) {
        return Language(
            iso639_1: json['iso639_1'], 
            iso639_2: json['iso639_2'], 
            name: json['name'], 
            nativeName: json['nativeName'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['iso639_1'] = this.iso639_1;
        data['iso639_2'] = this.iso639_2;
        data['name'] = this.name;
        data['nativeName'] = this.nativeName;
        return data;
    }
}