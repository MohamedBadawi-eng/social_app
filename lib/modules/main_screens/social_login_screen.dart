
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/main.dart';
import 'package:social/modules/main_screens/social_register_screen.dart';
import 'package:social/shared/cubits/login/login_cubit.dart';
import 'package:social/shared/cubits/login/login_states.dart';
import '../../layout/social_layout_screen.dart';
import '../../shared/components/components.dart';

class SocialLoginScreen extends StatelessWidget
{

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context)
      { return LoginCubit(); },

      child: BlocConsumer<LoginCubit,LoginAppStates>(
        listener: (context,state)
        {
          if(state is LoginErrorState)
          {
            // showMassage(context: context, massage: state.error);
          }
          else if (state is LoginSuccessState)
            {
              // showMassage(context: context, massage: 'Login Success',state: States.done);
              main();
              navigatorToAndFinish(context, SocialLayout( ));

            }

        },
        builder: (context,state)
        {
          LoginCubit cubit = LoginCubit.get(context);

          return Scaffold(
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
                        Text('LOGIN',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                        Text('login now to communicate with friends ',style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(height: 30,),
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
                          prefixIcon:Icon(Icons.security),
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
                        SizedBox(height: 30,),
                        ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context)
                            {
                              return    defaultButton(
                                text: 'LOGIN',
                                onPressed: ()
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    cubit.userLogin(email: emailController.text, password: passwordController.text,);

                                    // navigatorToAndFinish(context, SocialLayout());

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
                            Text('Don\'t have an account ?  ',style: TextStyle(fontSize: 15,),),
                            TextButton(onPressed: ()
                            {
                              navigatorToAndFinish(context, SocialRegisterScreen());
                            },
                              child:Text('REGISTER',style: TextStyle(fontSize: 15,),),
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
