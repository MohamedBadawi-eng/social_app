 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../modules/social_bots_screens/news/webview_screen.dart';
import '../cubits/cubit/cubit.dart';


Widget defaultButton ({
  double radius = 0.0,
  double width = double.infinity,
  Color  color = Colors.blue,
  String text = 'OK',
  required void Function() onPressed,
})
{
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius,),
      color:color ,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: MaterialButton(
        height: 50,
        onPressed: onPressed,
        child: Text(text,style:const  TextStyle(color: Colors.white),) ),
  );
}





Widget defaultTextField ({
  String textValidator  = 'Must Not Be Empty !',
  String lengthTextValidator  = 'Short Input !',
  int CharLength=1,
  TextEditingController? controller ,
  TextInputType keyboardType = TextInputType.emailAddress ,
  double radius = 00 ,
  String labelText = 'Enter Your Text Here ',
  Widget prefixIcon = const  Icon(Icons.telegram),
  Widget? suffixIcon ,
  bool password = false ,
  void Function()? onTap,
  void Function(String)? onChanged ,
  String? hintText,
  Color? backgraundColor,
  int? maxlenth,
})
{
  return TextFormField(
    validator: (String? value)
    {
      if(value.toString().isEmpty)
      {
        return textValidator;
      }
      else if(value.toString().length < CharLength )
      {
        return lengthTextValidator;
      }
      return null;
    },
     onTap: onTap,
    controller: controller ,
    keyboardType: keyboardType,
    onFieldSubmitted: (value){},
    onChanged: onChanged,
    obscureText: password,
    decoration: InputDecoration(
      filled: true,
      fillColor: backgraundColor,
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(radius),
      ),

    ),
  maxLength: maxlenth,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,

  );
}











Future<dynamic> navigatorTo (BuildContext context,Widget widget)
{
  return  Navigator.push(context, MaterialPageRoute(
    builder: (context)
    {
      return widget;
    },
  ),);
}



Future<dynamic> navigatorToAndFinish (BuildContext context,Widget widget)
{
  return  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context)
    {
      return widget;
    },
  ),
          (Route<dynamic> route )
      {
        return false;
      }
  );
}


 enum States  {done,error}
// void showMassage({required context,required String massage,States state = States.error})
// {
//   showToast(massage,
//     context: context,
//     animation: StyledToastAnimation.scale,
//     reverseAnimation: StyledToastAnimation.fade,
//     position: StyledToastPosition.bottom,
//     animDuration: Duration(seconds: 1),
//     duration: Duration(seconds: 4),
//     curve: Curves.elasticOut,
//     reverseCurve: Curves.linear,
//     backgroundColor: state == States.error? Colors.red:Colors.green,
//     borderRadius: BorderRadius.circular(30),
//   );
// }





 Widget buildTaskItem( Map? task ,context)
 {
   return Dismissible(
     key: Key(task!['id'].toString()),
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20.0),
       child: Row(
         children:
         [
           CircleAvatar(
             radius: 40,
             child: Text(task?['time']),
           ),
           SizedBox(width: 20,),
           Expanded(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children:
               [
                 Text(task?['title'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                 Text(task?['date'],style: TextStyle(color: Colors.grey),),
               ],
             ),
           ),
           Row(
             children:
             [
               SizedBox(width: 10,),
               IconButton(
                 onPressed:()
                 {
                   AppCubit.get(context).updateData(status:'done', id: task?['id']);
                 }, icon:Icon(Icons.cloud_done,color: Colors.green,),
               ),
               SizedBox(width: 10,),
               IconButton(
                 onPressed:()
                 {
                   AppCubit.get(context).updateData(status:'archive', id: task?['id']);
                 }, icon:Icon(Icons.archive,color: Colors.grey,),
               ),

             ],
           ),
         ],
       ),
     ),
     onDismissed: (direction)
     {
       AppCubit.get(context).deleteData( id: task?['id'] );
     },
   );
 }



 Widget buildNewsItem ( article , context)
 {
   return InkWell(
     onTap: ()
     {
       navigatorTo(context,WebViewScreen(article['url']) );
     },
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children:
         [
           Container(
             height: 130,
             width: 130,
             child: Image(image: NetworkImage(article['urlToImage']==null? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRriyoHp0ITkzft6BToMoVmYH2C6TD4k8AbUF0WhAgW0Xd1Rjba4JALt8D4eQY_Xl-x5hQ&usqp=CAU' : article['urlToImage'] ),
               height: 130,
               width: 130,
               fit: BoxFit.cover,
             ),
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20,),
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,

           ),
           SizedBox(width: 10,),
           Container(
             height: 120,
             width: 150,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children:
               [
                 Expanded(
                     child: Text(article['title'],
                       style: TextStyle(),
                       maxLines: 3,
                       overflow: TextOverflow.ellipsis,
                     )),
                 Text(article['publishedAt'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
               ],
             ),
           ),

         ],
       ),
     ),
   );
 }

