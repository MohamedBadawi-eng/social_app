
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

XFile? image;
String text = '';

// get image
Future pickImage(ImageSource source) async
{
    ImagePicker().pickImage(source: source).then((value)
    {
      image = XFile(value!.path);
      return XFile(value!.path);
    }).catchError((onError)
    {
      print(onError.toString());
    });

}

// get text
Future textRecognition(XFile img)async
{
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final inputImage = InputImage.fromFilePath(img.path);
  final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
  text = recognizedText.text;
}
