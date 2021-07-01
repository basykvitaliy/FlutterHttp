class Currency {
    String code;
    String name;
    String symbol;

    Currency({this.code, this.name, this.symbol});

    factory Currency.fromJson(Map<String, dynamic> json) {
        return Currency(
            code: json['code'], 
            name: json['name'], 
            symbol: json['symbol'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['name'] = this.name;
        data['symbol'] = this.symbol;
        return data;
    }
}