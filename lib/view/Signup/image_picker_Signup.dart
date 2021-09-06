import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:path/path.dart' as Path;


class ImagePickerForCategory extends StatefulWidget {
  //   Function(File) onimageselects;
  // ImagePickerForCategory({@required this.onimageselects});
   @override
  _ImagePickerForCategoryState createState() => _ImagePickerForCategoryState();
}

class _ImagePickerForCategoryState extends State<ImagePickerForCategory> {

   var  _image;
  final ImagePicker _picker = ImagePicker();

  var _uploadedFileURL;
  @override
  void initState() {
    super.initState();    
  }

// ignore: non_constant_identifier_names
  void open_camera() async {
    // ignore: deprecated_member_use
    var image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;        
    });
  }

  Future uploadFile() async {
    
    // StorageReference storageReference = FirebaseStorage.instance
    //     .ref()
    //     .child('chats/${Path.basename(_image.path)}');        
    // StorageUploadTask uploadTask = storageReference.putFile(_image);
    // await uploadTask.onComplete;
    // print('File Uploaded');
    // storageReference.getDownloadURL().then((fileURL) {
    //   setState(() {
    //     _uploadedFileURL = fileURL.toString();
    //     print(_uploadedFileURL);
    //   });
    // });
  }

  // ignore: non_constant_identifier_names
  void open_gallery() async {
    // ignore: deprecated_member_use
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      //widget.onimageselects(_image);
      print("???????????????>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<");
      
      print("path anme");
      print(Path.basename(_image.path));
      print("_image ...............");
      print(_image);
      print("_image ..extra.............");
      print(image);
      // uploadFile();
      // widget.onimageselects(_image);
      //       String fileName = basename(_imageFile.path);
      // StorageReference firebaseStorageRef =
      //     FirebaseStorage.instance.ref().child('uploads/$fileName');
      // StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
      // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      // taskSnapshot.ref.getDownloadURL().then(
      //       (value) => print("Done: $value"),
      //     );
      print("?????????????????????<<<<<<<<<<<<>>>>>>>>>>>>>>>");
    });
  }


  @override
  Widget build(BuildContext context) {
    return        SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            children: [

              (_image == null)
                  ? GestureDetector(
                      onTap: () {
                        open_gallery();
                      },
                      child: Container(
                          padding:
                              EdgeInsets.all(20), //padding of outer Container
                          child: DottedBorder(
                            color: Colors.black54, //color of dotted/dash line
                            strokeWidth: 2, //thickness of dash/dots
                            dashPattern: [10, 6],
                            child: Container(
                              height: 80, //height of inner container
                              width: 80,
                              child: IconButton(
                                  icon: Icon(Icons.add), onPressed: null),
                            ),
                          )),
                    )
                  : GestureDetector(
                      onTap: () {
                        open_gallery();
                      },
                      child: Container(
                        color: Colors.black12,
                        height: 300.0,
                        child: Image.file(_image),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}