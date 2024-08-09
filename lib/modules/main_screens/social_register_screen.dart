
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/modules/main_screens/social_login_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/cubits/register/register_cubit.dart';
import '../../shared/cubits/register/register_states.dart';

class SocialRegisterScreen extends StatelessWidget
{

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) 
  {
    return BlocProvider(
      create: (context)
      { return RegisterCubit(); },

      child: BlocConsumer<RegisterCubit,RegisterAppStates>(
        listener: (context,state)
        {
          if(state is RegisterCreateErrorState)
          {
            // showMassage(context: context, massage: state.error);
          }
          else if (state is RegisterCreateSuccessState)
          {
            // showMassage(context: context, massage: 'Register Success',state: States.done);
            navigatorToAndFinish(context, SocialLoginScreen());

          }
        },
        builder: (context,state)
        {
          RegisterCubit cubit = RegisterCubit.get(context);
          return  Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text('REGISTER',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                        Text('register now to communicate with friends ',style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(height: 30,),
                        defaultTextField(
                          controller: userController ,
                          keyboardType: TextInputType.text,
                          labelText: 'User Name',
                          prefixIcon: Icon(Icons.person),
                          radius: 5,
                        ),
                        SizedBox(height: 20,),
                        defaultTextField(
                          controller: emailController ,
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email),
                          radius: 5,
                        ),
                        SizedBox(height: 20,),
                        defaultTextField(
                          controller: passwordController ,
                          keyboardType: TextInputType.number,
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.security),
                          password: cubit.isPassword,
                          suffixIcon: IconButton(
                            onPressed: ()
                            {
                                cubit.changVisibleState();
                            },
                            icon:cubit.isPassword? Icon(Icons.remove_red_eye_outlined):Icon(Icons.remove_moderator),
                          ),
                          radius: 5,
                        ),
                        SizedBox(height: 20,),
                        defaultTextField(
                          controller: phoneController ,
                          keyboardType: TextInputType.number,
                          labelText: 'Phone',
                          prefixIcon: Icon(Icons.phone),
                          radius: 5,
                        ),
                        SizedBox(height: 30,),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context)
                          {
                            return  defaultButton(
                              text: 'REGISTER',
                              onPressed: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  cubit.userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: userController.text,
                                    phone: phoneController.text,
                                  );


                                }

                              },
                              radius: 5,
                            );
                          },
                          fallback: (context)
                          {
                            return Center(child: CircularProgressIndicator());
                          },
                        ),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Text('Have an account ?  ',style: TextStyle(fontSize: 15,),),
                            TextButton(onPressed: ()
                            {
                              navigatorToAndFinish(context, SocialLoginScreen());
                            },
                              child:Text('LOGIN',style: TextStyle(fontSize: 15,),),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          
        },
      ),
    ); 
  }
}
