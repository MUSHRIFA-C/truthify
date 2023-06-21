import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
class Scanlogo extends StatefulWidget {
  const Scanlogo({Key? key}) : super(key: key);

  @override
  State<Scanlogo> createState() => _ScanlogoState();
}
class _ScanlogoState extends State<Scanlogo> {
  late final _filename;
  File? imageFile;
  late String storedImage;
  String text='';
  bool viewVisible = true ;

  void showWidget(){
    setState(() {
      viewVisible = true ;
    });
  }
  void hideWidget(){
    setState(() {
      viewVisible = false ;
    }
    );
  }
  Future<void> _showChoiceDialog2(BuildContext context) {
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
                  const Padding(padding: EdgeInsets.all(10.0)),
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
  Future<void> submitForm() async {

    var uri = Uri.parse('https://6e57-42-106-190-110.ngrok-free.app/api/logo_detection'); // Replace with your API endpoint
    print(_filename);

    var request = http.MultipartRequest('POST', uri);

    final imageStream = http.ByteStream(imageFile!.openRead());
    final imageLength = await imageFile!.length();

    final multipartFile = await http.MultipartFile(
      'test_image',imageStream,imageLength,
      filename: _filename ,
      // contentType: MediaType('image', 'jpeg'), // Replace with your desired image type
    );


    print("file1${_filename}");
    request.files.add(multipartFile);

    final response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      var data = jsonResponse['data'];
      text=data['answer'];
      print(text);

      // Fluttertoast.showToast(
      //   msg:text,
      //   backgroundColor: Colors.grey,
      // );

      print('Response: $responseBody');
      print('Form submitted successfully');

    }
    else {
      print('Error submitting form. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,title: Text("Scan Logo"),),
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/img_7.png'),fit:BoxFit.fill),),
        child: Column(
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                child: imageFile== null?
                Container(
                  child: Column(
                    children: <Widget>[
                      Align(alignment: Alignment.center,),
                      ElevatedButton(
                        onPressed: () {
                          //    _getFromGallery();
                          _showChoiceDialog2(context);
                        },
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.purple),
                        child: Text("Upload Your Image",style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ):
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Image.file(imageFile!,
                        width: 200,
                        height: 400,
                        //  fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: () {
                        //    _getFromGallery();
                        _showChoiceDialog2(context);
                      },
                      child: Text("Upload Your Image"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 70,),
            ElevatedButton(
              onPressed: () {
                showWidget();
                submitForm();
              },
              child: Text("Detect"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            ),

            SizedBox(height: 10,),
            Visibility(
                visible: viewVisible,
                child: Text(
                  text.toUpperCase(),style: TextStyle(fontSize: 20),))
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
        _filename = basename(imageFile!.path);
        //  _filename = basename(imageFile!.path);
        // final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
        // final _extenion = extension(imageFile!.path);
        // print("imageFile:${imageFile}");
        // print(_filename);
        // print(_nameWithoutExtension);
        // print(_extenion);
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
        _filename = basename(imageFile!.path);
         _filename = basename(imageFile!.path).toString();
        final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
        final _extenion = extension(imageFile!.path);
      });
    }
  }
// _getFromGallery2() async {
//   PickedFile? pickedFile = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     setState(()  {
//       imageFile2 = File(pickedFile.path);
//       // _filename2 = basename(imageFile2!.path);
//       /* _filename = basename(imageFile!.path);
//       final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
//       final _extenion = extension(imageFile!.path);
//       print("imageFile:${imageFile}");
//       print(_filename);
//       print(_nameWithoutExtension);
//       print(_extenion);*/
//     });
//   }
// }
// /// Get from Camera
// _getFromCamera2() async {
//   PickedFile? pickedFile = await ImagePicker().getImage(
//     source: ImageSource.camera,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     setState(() {
//       imageFile2 = File(pickedFile.path);
//
//       // _filename2 = basename(imageFile2!.path);
//       /* _filename = basename(imageFile!.path).toString();
//       final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
//       final _extenion = extension(imageFile!.path);*/
//     });
//   }
// }
}
