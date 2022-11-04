import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:convert';
// import 'Json2Dart.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoGenerate{
  AutoGenerate({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });
  late final List<dynamic> categories;
  late final String createdAt;
  late final String iconUrl;
  late final String id;
  late final String updatedAt;
  late final String url;
  late final String value;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    categories = List.castFrom<dynamic, dynamic>(json['categories']);
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categories'] = categories;
    _data['created_at'] = createdAt;
    _data['icon_url'] = iconUrl;
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['url'] = url;
    _data['value'] = value;
    return _data;
  }
  // Hell
}

class JokeModel extends ChangeNotifier{

  late AutoGenerate joke_serial;
  List<dynamic>? categories;
  String? id;
  String? url;
  String? value;
  List<String?> Favs = [];


  Future<void> API() async {
    Uri url = Uri.parse('https://api.chucknorris.io/jokes/random');
    http.Response res = await http.get(url);
    dynamic body = jsonDecode(res.body);
    joke_serial = AutoGenerate.fromJson(body);
    Decode(joke_serial);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(id ?? '0', value ?? 'Joke Not found!!');
    final joke = prefs.getString( id ?? '');
    // print(joke);
    }

    void Decode(AutoGenerate value1){
    categories = value1.categories;
    id = value1.id;
    url = value1.url;
    value = value1.value;
    notifyListeners();

  }
  void Add() {
    if (!Favs.contains(value)){
      Favs.add(value);
      notifyListeners();
    }

    // Favs.add(CurrentJoke.Fav(category_: categories, id_: id, url_: url, value_: value));
  }
  // CurrentJoke({this.categories, this.id, this.url, this.value});
}

