import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scanlogo extends StatefulWidget {
  const Scanlogo({Key? key}) : super(key: key);

  @override
  State<Scanlogo> createState() => _ScanlogoState();
}

class _ScanlogoState extends State<Scanlogo> {
  late final _filename;
  File? imageFile;
  late String storedImage;
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:const Text("Choose from"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text("Gallery"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.pop(context);
                      //  _openGallery(context);
                    },
                  ),
                  SizedBox(height:10),
                  const Padding(padding: EdgeInsets.all(0.0)),
                  GestureDetector(
                    child: const Text("Camera"),
                    onTap: () {
                      _getFromCamera();

                      Navigator.pop(context);
                      //   _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,title: Text("Scan Logo"),),


    body:Container(
    decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/img_7.png'),fit:BoxFit.fill
    ),
  ),
    child: imageFile == null
    ? Container(
    child: Column(
    children: <Widget>[Align(alignment: Alignment.center,),
    SizedBox(height: 330,),
    ElevatedButton(
    onPressed: () {
      //    _getFromGallery();
      _showChoiceDialog(context);
    },
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.purple),
    child: Text("Upload Image",style: TextStyle(color: Colors.white)),
    ),
    Container(
    height: 40.0,
    ),

    ],
    ),
    ): Row(
    children: [
    Container(
    alignment: Alignment.centerLeft,
    child: Image.file(
    imageFile!,
    width: 300,
    height: 300,
    //  fit: BoxFit.cover,
    ),
    ), ElevatedButton(
    onPressed: () {
    //    _getFromGallery();
    _showChoiceDialog(context);
    },
    child: Text("Upload Image"),
    ),
    ],
    ),
    ),


    ));
  }
  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(()  {

        imageFile = File(pickedFile.path);
       /* _filename = basename(imageFile!.path);
        final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
        final _extenion = extension(imageFile!.path);
        print("imageFile:${imageFile}");
        print(_filename);
        print(_nameWithoutExtension);
        print(_extenion);*/
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
       /* _filename = basename(imageFile!.path).toString();
        final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
        final _extenion = extension(imageFile!.path);*/

      });
    }
  }
}
