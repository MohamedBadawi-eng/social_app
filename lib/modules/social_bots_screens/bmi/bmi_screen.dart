import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatelessWidget
{
    BMIScreen({super.key});
  var slider = 120.0;
  var age = 22.0;
  var waight = 70;
  bool isMale = true;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('BMI Calculator', style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children:
        [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale? Colors.blue:Colors.grey,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Image(
                              image: AssetImage('assets/images/male.png'),
                              height: 100,
                              width: 100,
                              color: Colors.black,
                            ),
                            Text('MALE',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale? Colors.grey:Colors.blue,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Image(
                              image: AssetImage('assets/images/female.png'),
                              height: 100,
                              width: 100,
                              color: Colors.black,
                            ),
                            Text('FEMALE',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text('HIGHT',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Text('${slider.round()}',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('CM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    Slider(
                      value: slider,
                      min: 80,
                      max: 220,
                      onChanged: (count)
                      {

                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text('AGE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text('${age.round()}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              FloatingActionButton(
                                mini: true,
                                onPressed: ()
                                {

                                },
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                mini: true,
                                onPressed: ()
                                {

                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text('WEIGHT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text('${waight.round()}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              FloatingActionButton(
                                mini: true,
                                onPressed: ()
                                {

                                },
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                mini: true,
                                onPressed: ()
                                {

                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],),
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.blue,

          ),
        ],
      ),
    );
  }
}
