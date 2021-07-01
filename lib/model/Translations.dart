class Translations {
    String it;
    String br;
    String de;
    String es;
    String fa;
    String fr;
    String hr;
    String ja;
    String nl;
    String pt;

    Translations({this.it, this.br, this.de, this.es, this.fa, this.fr, this.hr, this.ja, this.nl, this.pt});

    factory Translations.fromJson(Map<String, dynamic> json) {
        return Translations(
            it: json['`it`'],
            br: json['br'], 
            de: json['de'], 
            es: json['es'], 
            fa: json['fa'], 
            fr: json['fr'], 
            hr: json['hr'], 
            ja: json['ja'], 
            nl: json['nl'], 
            pt: json['pt'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['`it`'] = this.it;
        data['br'] = this.br;
        data['de'] = this.de;
        data['es'] = this.es;
        data['fa'] = this.fa;
        data['fr'] = this.fr;
        data['hr'] = this.hr;
        data['ja'] = this.ja;
        data['nl'] = this.nl;
        data['pt'] = this.pt;
        return data;
    }
}