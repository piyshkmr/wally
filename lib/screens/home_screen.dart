import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:wally/models/WallPaper.dart';
import 'package:wally/utilities/global.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wally"),
      ),
      body: Column(
        children: const [Expanded(child: WallPapers())],
      ),
    );
  }
}

class WallPapers extends StatefulWidget {
  const WallPapers({Key? key}) : super(key: key);

  @override
  _WallPapersState createState() => _WallPapersState();
}

class _WallPapersState extends State<WallPapers> {
  @override
  void initState() {
    super.initState();

    getWallpapers();
  }

  void getWallpapers() async {
    final url = Uri.parse(
        "https://api.unsplash.com/photos/random?client_id=ZeL6vBdOMA_Vj4ZfSpSSVcc6-0LJBYWW4dcjZFqlsso&count=30&page=1&order_by=latest");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        Global.wallpapers =
            (data as List).map((item) => Wallpaper.fromJson(item)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Global.wallpapers.isNotEmpty
        ? StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: Global.wallpapers.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Global.index = index;
                  Navigator.pushNamed(context, "fullscreen");
                },
                child: Image.network(
                  Global.wallpapers[index].urls.thumb,
                  fit: BoxFit.cover,
                ),
              );
            },
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )
        : const Center(child: CircularProgressIndicator());
  }
}
