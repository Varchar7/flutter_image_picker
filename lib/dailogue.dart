import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFromDailogue extends StatefulWidget {
  ImageFromDailogue({Key? key}) : super(key: key);

  @override
  State<ImageFromDailogue> createState() => _ImageFromDailogueState();
}

class _ImageFromDailogueState extends State<ImageFromDailogue> {
  String imagePath = '';

  TextButton bottomSheetButton(
      {required VoidCallback onPressed, required String title}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }

  void pickImageFromBrowser() async {
    ImagePicker pick = ImagePicker();
    final image = await pick.pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = image!.path;
    });
  }

  void pickImageFromCamera() async {
    ImagePicker pick = ImagePicker();
    final image = await pick.pickImage(source: ImageSource.camera);
    setState(() {
      imagePath = image!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: imagePath == ''
            ? const Text(
                'Image Not Found',
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            : GestureDetector(
                child: Image.file(
                  File(
                    imagePath,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 125,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            bottomSheetButton(
                              title: "Camera",
                              onPressed: pickImageFromCamera,
                            ),
                            bottomSheetButton(
                              title: "Gallery",
                              onPressed: pickImageFromBrowser,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}
