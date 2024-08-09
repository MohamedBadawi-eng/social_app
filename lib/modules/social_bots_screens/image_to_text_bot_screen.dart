import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';

class ImageToTextScreen extends StatefulWidget
{
  const ImageToTextScreen({super.key});

  @override
  State<ImageToTextScreen> createState() => _ImageToTextScreenState();
}

class _ImageToTextScreenState extends State<ImageToTextScreen>
{
  // get image
  File? imageForProcess;
  Future<void> getImage(
      ImageSource source
      ) async
  {
    var picker = ImagePicker();
    final pickedFile  = await picker.pickImage(
      source : source,
    );

    if (pickedFile != null)
    {
      setState(() {
        imageForProcess =  File(pickedFile.path);
        print('imageForProcess selected');
      });


    }
    else
    {
      print('Error no imageForProcess selected');
    }

  }

  String text='';
  // get text
  Future<void> textRecognition(File img) async
  {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final inputImage = InputImage.fromFilePath(img.path);
    textRecognizer.processImage(inputImage).then((value)
    {
      setState(()
      {
        text = value.text;
        print(value.text);
        // idController.text=text;
      });

    }).catchError((onError)
    {
      print(onError.toString());
    });

  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon(IconBroken.Arrow___Left_2), onPressed: ()
        {
          Navigator.pop(context);
        },),
        titleSpacing: 0,
        title: const Row(
          children:
          [
            CircleAvatar(
              backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/h5UHVGzxvOCyQkcrl0TzWd2__AMlF6jRgQifnYDZpeSEByA2Os7P2rKlm8WjnNmrcnLF'),
              radius: 20,

            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Row(
                  children:
                  [
                    Text('Image Processes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                    SizedBox(width: 10,),
                    Icon(Icons.check_circle,color: Colors.blue,size: 16,),
                  ],
                ),
                Text('Bot',style: TextStyle(color:Colors.grey,fontSize: 14)),
              ],
            ),

          ],
        ),

        actions:
        [
          IconButton(onPressed: (){}, icon:const  Icon(Icons.more_vert_outlined)),
        ],
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: imageForProcess==null?
                  Image(image: NetworkImage('https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg'),
                    height: 340,
                    width: 340,
                  fit: BoxFit.cover,
                  )
                      :
                  Image( image: FileImage(imageForProcess!),
                    height: 340,
                    width: 340,
                    fit: BoxFit.cover,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                       OutlinedButton.icon(
                          onPressed: ()
                          {
                            setState(() {
                              getImage(ImageSource.gallery).then((value)
                              {
                                textRecognition(imageForProcess!);
                              });
        
                            });
        
                          },
                        label: Text('Gallery'),
                        icon: Icon(IconBroken.Image_2),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Make the edges sharp
                              side:const  BorderSide(color: Colors.blue), // Add an outer border
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                          onPressed: ()
                          {
                            setState(() {
                              getImage(ImageSource.camera).then((value)
                              {
                                textRecognition(imageForProcess!);
                              });
                            });
                          },
                        label: Text('Camera'),
                        icon: Icon(IconBroken.Camera),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Make the edges sharp
                              side:const  BorderSide(color: Colors.blue), // Add an outer border
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Your Text ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                text==''? Text('Will Appear Here ',style: TextStyle(color: Colors.grey),): SelectableText(text),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
