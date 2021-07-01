import 'Currency.dart';
import 'Language.dart';
import 'RegionalBloc.dart';
import 'Translations.dart';

class Countries {
    String alpha2Code;
    String alpha3Code;
    List<String> altSpellings;
    double area;
    List<Object> borders;
    List<String> callingCodes;
    String capital;
    String cioc;
    List<Currency> currencies;
    String demonym;
    String flag;
    Object gini;
    List<Language> languages;
    List<double> latlng;
    String name;
    String nativeName;
    String numericCode;
    int population;
    String region;
    List<RegionalBloc> regionalBlocs;
    String subregion;
    List<String> timezones;
    List<String> topLevelDomain;
    Translations translations;

    Countries({this.alpha2Code, this.alpha3Code, this.altSpellings, this.area, this.borders, this.callingCodes, this.capital, this.cioc, this.currencies, this.demonym, this.flag, this.gini, this.languages, this.latlng, this.name, this.nativeName, this.numericCode, this.population, this.region, this.regionalBlocs, this.subregion, this.timezones, this.topLevelDomain, this.translations});

    factory Countries.fromJson(Map<String, dynamic> json) {
        return Countries(
            alpha2Code: json['alpha2Code'], 
            alpha3Code: json['alpha3Code'], 
            altSpellings: json['altSpellings'] != null ? new List<String>.from(json['altSpellings']) : null, 
            area: json['area'], 
            //borders: json['borders'] != null ? (json['borders'] as List).map((i) => Object.fromJson(i)).toList() : null,
            callingCodes: json['callingCodes'] != null ? new List<String>.from(json['callingCodes']) : null, 
            capital: json['capital'], 
            cioc: json['cioc'], 
            currencies: json['currencies'] != null ? (json['currencies'] as List).map((i) => Currency.fromJson(i)).toList() : null, 
            demonym: json['demonym'], 
            flag: json['flag'], 
            //gini: json['gini'] != null ? Object.fromJson(json['gini']) : null,
            languages: json['languages'] != null ? (json['languages'] as List).map((i) => Language.fromJson(i)).toList() : null, 
            latlng: json['latlng'] != null ? new List<double>.from(json['latlng']) : null, 
            name: json['name'], 
            nativeName: json['nativeName'], 
            numericCode: json['numericCode'], 
            population: json['population'], 
            region: json['region'], 
            regionalBlocs: json['regionalBlocs'] != null ? (json['regionalBlocs'] as List).map((i) => RegionalBloc.fromJson(i)).toList() : null, 
            subregion: json['subregion'], 
            timezones: json['timezones'] != null ? new List<String>.from(json['timezones']) : null, 
            topLevelDomain: json['topLevelDomain'] != null ? new List<String>.from(json['topLevelDomain']) : null, 
            translations: json['translations'] != null ? Translations.fromJson(json['translations']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alpha2Code'] = this.alpha2Code;
        data['alpha3Code'] = this.alpha3Code;
        data['area'] = this.area;
        data['capital'] = this.capital;
        data['cioc'] = this.cioc;
        data['demonym'] = this.demonym;
        data['flag'] = this.flag;
        data['name'] = this.name;
        data['nativeName'] = this.nativeName;
        data['numericCode'] = this.numericCode;
        data['population'] = this.population;
        data['region'] = this.region;
        data['subregion'] = this.subregion;
        if (this.altSpellings != null) {
            data['altSpellings'] = this.altSpellings;
        }
        // if (this.borders != null) {
        //     data['borders'] = this.borders.map((v) => v.toJson()).toList();
        // }
        if (this.callingCodes != null) {
            data['callingCodes'] = this.callingCodes;
        }
        if (this.currencies != null) {
            data['currencies'] = this.currencies.map((v) => v.toJson()).toList();
        }
        // if (this.gini != null) {
        //     data['gini'] = this.gini.toJson();
        // }
        if (this.languages != null) {
            data['languages'] = this.languages.map((v) => v.toJson()).toList();
        }
        if (this.latlng != null) {
            data['latlng'] = this.latlng;
        }
        if (this.regionalBlocs != null) {
            data['regionalBlocs'] = this.regionalBlocs.map((v) => v.toJson()).toList();
        }
        if (this.timezones != null) {
            data['timezones'] = this.timezones;
        }
        if (this.topLevelDomain != null) {
            data['topLevelDomain'] = this.topLevelDomain;
        }
        if (this.translations != null) {
            data['translations'] = this.translations.toJson();
        }
        return data;
    }
}