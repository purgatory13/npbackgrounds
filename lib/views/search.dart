import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:npbackgrounds/data/data.dart';
import 'package:npbackgrounds/model/wallpaper_model.dart';
import 'package:npbackgrounds/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {

  final String searchQuery;

  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

  getSearchWallpapers(String query) async{
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=15&page=1",
        headers:{
          "Authorization" : apiKey});

    // print(response.body.toString());
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);

    });

    setState(() {});

  }

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(children: <Widget>[
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: "search wallpaper",
                      border: InputBorder.none
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  getSearchWallpapers(searchController.text);
                },
                child: Container(
                    child: Icon(Icons.search)),
              )
            ],),
          ),
          wallpapersList(wallpapers: wallpapers, context: context)
        ])),
      ),
    );
  }
}
