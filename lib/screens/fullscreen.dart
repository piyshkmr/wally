import 'package:flutter/material.dart';
import 'package:wally/utilities/global.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({Key? key}) : super(key: key);

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  bool showCroped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: Global.wallpapers.length,
        controller: PageController(initialPage: Global.index),
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: () {
              setState(() {
                showCroped = !showCroped;
              });
            },
            child: Image.network(Global.wallpapers[index].urls.regular,
                fit: showCroped ? BoxFit.cover : BoxFit.contain),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Set As Wallpaper",
        onPressed: () async {},
        child: const Icon(
          Icons.photo,
          color: Colors.white,
        ),
      ),
    );
  }
}
