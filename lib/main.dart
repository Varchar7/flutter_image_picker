import 'package:flutter/material.dart';
import 'package:flutter_image_picker/dailogue.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Social App',
      theme: ThemeData(
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      debugShowCheckedModeBanner: false,
      home: ImageFromDailogue(),
    );
  }
}
