import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/shared/components/components.dart';
import 'id_result_screen.dart';

class IDHomeScreen extends StatefulWidget
{
  const IDHomeScreen({super.key});
  @override
  State<IDHomeScreen> createState() => _IDHomeScreenState();
}

class _IDHomeScreenState extends State<IDHomeScreen>
{

  get onChanged => null;
  bool cheked =true;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var idController = TextEditingController();


  // get image
  File? idImage;
  Future<void> getIdImage() async
  {
    var picker = ImagePicker();
    final pickedFile  = await picker.pickImage(
      source : ImageSource.camera,
    );

    if (pickedFile != null)
    {
      idImage =  File(pickedFile.path);
      print('idImage selected');

    }
    else
    {
      print('Error no idImage selected');
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
        idController.text=text;
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
      body: SingleChildScrollView(
        child: Column(
          children:
          [
            Stack(
        
              children:
              [
                Image.asset(
                  'assets/images/backgraund_id.png',
                  fit:BoxFit.cover,
                  height:MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                  children:
                  [
                    // App Bar
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children:
                        [
                          IconButton(
                            onPressed:()
                            {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new,
                              color: Color(0xffB4AD91) ,),
        
                          ),
                          const Expanded(
                            flex:1,
                            child: Text(
                              'DATA',
                              style: TextStyle(
                                color:Color(0xffF19755),
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                shadows:
                                [
                                  Shadow(color:Colors.black,blurRadius: 5,offset: Offset(2, 2)),
                                  Shadow(color:Colors.blue,blurRadius: 5,offset: Offset(1, 1)),
                                ],
                              ),
                              textAlign:TextAlign.center,
                            ),
                          ),
                          IconButton(
                            onPressed: ()
                            {
        
        
                            },
                            icon:const Icon(
                              Icons.archive,
                              color: Color(0xffB4AD91),
                            ),
        
                          ),
        
                        ],
                      ),
                    ),
        
                    // Body
                    Padding(
                      padding: const EdgeInsets.only(left:35.0,right: 35.0),
                      child: Form(
                        key: formKey,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            SizedBox(height: 90,),
                            // Input
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                const Text(
                                  "Name ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffF9ECB7),
                                  ),
                                ),
                                const SizedBox(height: 2.0,),
                                defaultTextField(
                                  controller: nameController,
                                  labelText: '',
                                  hintText: 'Enter Your Name ',
                                  radius: 30,
                                  prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.grey,),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                const Text(
                                  "ID ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffF9ECB7),
                                  ),
                                ),
                                const SizedBox(height: 2.0,),
                                defaultTextField(
                                  controller: idController,
                                    keyboardType: TextInputType.number,
                                    maxlenth: 14,
                                    labelText: '',
                                    hintText: 'Enter Your ID ',
                                    radius: 30,
                                    prefixIcon: Icon(Icons.credit_card,color: Colors.grey,),
                                    suffixIcon: IconButton(onPressed: ()
                                    {

                                        getIdImage().then((value)
                                        {
                                          if(idImage!=null )
                                          {
                                            textRecognition(idImage!);
                                            idController.text = text;
                                          }
                                        });




                                    }, icon: Icon(Icons.camera_alt_outlined))
                                ),


                              ],
                            ),




                            // accept
                            Row(
                              children:
                              [
                                Checkbox(
                                  value: cheked,
                                  fillColor:MaterialStateProperty.all(Colors.white70),
                                  overlayColor:MaterialStateProperty.all(Colors.red),
                                  focusColor:Colors.blue,
                                  hoverColor:Colors.blue,
                                  onChanged:(value)
                                  {
                                    setState(()
                                    {
                                      cheked=!cheked;
                                    });
                                  },
                                ),
                                const Text(
                                  "I Accept The Terms Of Us",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffF19755),
                                  ),

                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0,),

                            // save
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: const Color(0xff233975),
                              ),

                              clipBehavior:Clip.antiAliasWithSaveLayer,
                              width: double.infinity,
                              height: 60.0,
                              child: TextButton(
                                onPressed:()
                                {
                                  setState(()
                                  {
                                    if(formKey.currentState!.validate())
                                    {
                                      if (cheked==true)
                                      {
                                        var data = analyzeEgyptianNationalID(idController.text);
                                        if(data['isNum']=='no')
                                        {
                                          // showMassage(context: context, massage: 'Error in ID ! Enter Numbers .',state: States.error);

                                        }
                                        else if (data['state']=='error')
                                          {
                                            // showMassage(context: context, massage: 'Error in ID ! Check Length .',state: States.error);
                                          }
                                        else
                                          {
                                            navigatorTo(context, ResultScreen(
                                              name: nameController.text,
                                              date: data['date']! ,
                                              horoscope: data['horoscope']!,
                                              age: data['age']!,
                                              governorate: data['governorate']!,
                                            ));
                                          }

                                      }
                                      else
                                      {
                                        // showMassage(context: context, massage: 'Accept The Terms ! ' );
                                      }
                                    }
                                  });


                                }
                                ,
                                child:const Text(
                                  "RESULT",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 90.0,),

                            // Text
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const
                                [
                                  Text(
                                    "By continuing.you agree to accept our",
                                    style: TextStyle(fontSize: 8.0,color: Colors.grey),
                                  ),
                                  Text(
                                    "Privacy Policy & Terms of Service",
                                    style: TextStyle(fontSize: 8.0,color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5.0,),

                            // Learn
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children:
                              [
                                const Text(
                                  "       Already have an ID?",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Color(0xffF9ECB7),
                                  ),
                                ),
                                TextButton(
                                  onPressed: ()
                                  {
                                    // Navigator.of(context).pushReplacement(
                                    //   MaterialPageRoute(builder: (_)
                                    //   {
                                    //     return const LearnScreen();
                                    //   },
                                    //   ),
                                    // );
                                  },
                                  child: const Text(
                                    "Learn",
                                    style: TextStyle(fontSize: 11.0),
                                  ),
                                ),
                              ],
                            ),

                            // Icons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                IconButton(
                                  onPressed:()
                                  {
                                    // launchUrl(Uri.parse('https://www.facebook.com/padawy.top'));
                                  },
                                  icon: const Icon(
                                    Icons.facebook,
                                    color: Color(0xff0377EB),
                                  ),
                                ),
                                const SizedBox(width: 10.0,),
                                IconButton(
                                  onPressed:()
                                  {
                                    // launchUrl(Uri.parse('https://www.youtube.com/channel/UCQhq4qKzL1h4ahrSyK8gQ7Q'));
                                  },
                                  icon: const Icon(
                                    Icons.live_tv,
                                    color: Color(0xff9A4E53),
                                  ),
                                ),
                                const SizedBox(width: 10.0,),
                                IconButton(
                                  onPressed:()
                                  {
                                    // launchUrl(Uri.parse('https://t.me/MohamedBadawii'));
                                  },
                                  icon: const Icon(
                                    Icons.telegram,
                                    color: Color(0xffF9ECB7),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15.0,),

                            // Me
                            const Center(
                              child:  Text(
                                "Directed By Mohamed Badawi",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.blueGrey
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
        
            ),
          ],
        ),
      ),
    );
  }
}





Map<String,String> analyzeEgyptianNationalID(String nationalID)
{
  Map<String,String>? Data=
  {
    'state':'',
    'isNum':'yes',
    'date':'',
    'governorate':'',
    'age':'',
    'horoscope':'',
  };

  // التحقق من صحة الرقم القومي
  bool checked = false;
  try
  {
    int num = int.parse(nationalID);
    checked=true;

  }
  catch(error)
  {
    checked=false;
  }

  if (nationalID.length == 14 && checked)
  {
    Data['state']='done';
    Data['isNum']='yes';
    // استخراج السن وتاريخ الميلاد
    int year = int.parse(nationalID.substring(1, 3));
    int month = int.parse(nationalID.substring(3, 5));
    int day = int.parse(nationalID.substring(5, 7));
    int century = int.parse(nationalID[0]) == 2 ? 1900 : 2000;
    int birthYear = century + year;
    int age = DateTime.now().year - birthYear;

    // استخراج المحافظة
    int governorateCode = int.parse(nationalID.substring(7, 9));
    String governorate = getGovernorate(governorateCode);

    // طباعة النتائج
    Data['date']='$day/$month/$birthYear';
    Data['age']='$age';
    Data['governorate']='$governorate';
    Data['horoscope']=getHoroscopes(month, day);
    print(Data);
  }
  else
  {

    if(!checked)
      {
        Data['isNum']='no';
      }
    Data['state']='error';

  }



  return Data;

}

String getGovernorate(int code)
{
  switch (code) {
    case 1:
      return 'Cairo';
    case 2:
      return 'Alexandria';
    case 3:
      return 'Port Said';
    case 4:
      return 'Suez';
    case 11:
      return 'Damietta';
    case 12:
      return 'Dakahlia';
    case 13:
      return 'Sharqia';
    case 14:
      return 'Qalyubia';
    case 15:
      return 'Kafr El Sheikh';
    case 16:
      return 'Gharbia';
    case 17:
      return 'Monufia';
    case 18:
      return 'Ismailia';
    case 19:
      return 'El Behera';
    case 21:
      return 'Giza';
    case 22:
      return 'Beni Suef';
    case 23:
      return 'Faiyum';
    case 24:
      return 'Minya';
    case 25:
      return 'Assiut';
    case 26:
      return 'Sohag';
    case 27:
      return 'Qena';
    case 28:
      return 'Aswan';
    case 29:
      return 'Luxor';
    case 31:
      return 'Red Sea';
    case 32:
      return 'New Valley';
    case 33:
      return 'Matrouh';
    case 34:
      return 'North Sinai';
    case 35:
      return 'South Sinai';
    case 88:
      return 'OUT Of Egypt';
    default:
      return 'Unknown';
  }
}


String getHoroscopes(int month , int day)
{
if ((month==3 && day>=21)||(month==4 && day<=20))
{
// الحمل
return 'Aries';
}
else if ((month == 4 && day >= 21) || (month == 5 && day <= 21))
{
// الثور
  return 'Taurus';
}
else if ((month == 5 && day >= 22) || (month == 6 && day <= 21))
{
// الجوزاء
  return 'Gemimi';
}
else if ((month == 6 && day >= 22) || (month == 7 && day <= 22))
{
// السرطان
  return 'Cancer';
}
else if ((month == 7 && day >= 23) || (month == 8 && day <= 22))
{
// الاسد
  return 'Leo';
}
else if ((month == 8 && day >= 23) || (month == 9 && day <= 22))
{
// العذراء
  return 'Virgo';
}
else if ((month == 9 && day >= 23) || (month == 10 && day <= 22))
{
// الميزان
  return 'Libra';
}
else if ((month == 10 && day >= 23) || (month == 11 && day <= 21))
{
// العقرب
  return 'Scorpio';
}
else if ((month == 11 && day >= 22) || (month == 12 && day <= 21))
{
// القوس
  return 'Sagittarius';
}
else if ((month == 12 && day >= 22) || (month == 1 && day <= 20))
{
// الجدي
  return 'Capricorn';
}
else if ((month == 1 && day >= 21) || (month == 2 && day <= 19))
{
// الدلو
  return 'Aquarius';
}
else if ((month == 2 && day >= 20) || (month == 3 && day <= 20))
{
// الحوت
  return 'Pisces';
}
else
  {
    return'Unknown';
  }
}





