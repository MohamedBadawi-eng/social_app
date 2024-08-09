import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget
{
  final double result;
  final double age ;
  final bool ismale ;

  BMIResultScreen ({ required this.result,required this.age,required this.ismale}) ;
  @override
  Widget build(BuildContext context)
  {
    var state = result<18.5? 'underweight range' :
    result>=18.5 && result<= 24.9? 'Healthy Weight range' :
    result >= 25 && result <= 29.9 ? 'overweight range' : 'Input Error ! ';

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Result Screen', style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Image(
              image: AssetImage('${ismale?'assets/images/male.png':'assets/images/female.png'}'),
              height: 100,
              width: 100,
              color: Colors.black,
            ),
            Text('Gender : ${ismale? 'Male': 'Female'}',style: TextStyle(fontSize: 30),),
            Text('Age : ${age.round()}',style: TextStyle(fontSize: 25),),
            Text('Result : ${result.round()}',style: TextStyle(fontSize: 30),),
            Image(
              image: AssetImage('${state=='underweight range'? 'assets/images/underweight.png':
              state=='Healthy Weight range'? 'assets/images/HealthyWeight.png':
              state=='overweight range'? 'assets/images/overweight.png': 'assets/images/error.png'
              }'),
              height: 100,
              width: 100,
              color: Colors.black,
            ),
            Text( state ,style: TextStyle(fontSize: 30),),

          ],
        ),
      ),
    );
  }
}
