import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:perla_tech/core/router/router.dart';
import 'package:perla_tech/core/strings/app_strings.dart';
import 'package:perla_tech/features/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:perla_tech/features/presentation/widgets/my_button.dart';
import 'package:perla_tech/features/presentation/widgets/my_text_form_field.dart';

import '../../../core/color/color_manger.dart';

class LoginPage extends StatefulWidget {

   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumberController = TextEditingController();

  final  _passwordController = TextEditingController();

  final  _formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 96.h),
                    Text(
                      AppStrings().welcomeBack,
                      style:Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 4.h,),
                    Text(
                      AppStrings().enterYourDataToContinue,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 48.h),
                    Text(
                      AppStrings().phoneNumber,
                      style:Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 12.h,),
                    MyTextFormField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validate: (value){
                          if(value!.isEmpty){
                            return AppStrings().phoneNumberCantBeEmpty;
                          }
                          return null;
                        },
                        lable: AppStrings().enterYourPhoneNumber,
                        prefix: Icons.phone
                    ),
                    SizedBox(height:24.h),
                    Text(
                        AppStrings().password,
                      style: Theme.of(context).textTheme.titleMedium
                    ),
                    SizedBox(height: 12.h,),
                    MyTextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validate: (value){
                          if(value!.isEmpty){
                            return  AppStrings().passwordCantBeEmpty;
                          }
                          return null;
                        },
                        lable: AppStrings().enterYourPassword,
                        prefix: Icons.lock_outline,
                      isPassword: isPassword ,
                      suffix: isPassword ?  Icons.visibility_off : Icons.visibility,
                      suffixPressed: (){
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                    ),
                    SizedBox(height: 360.h),

                    BlocConsumer<LoginBloc , LoginState>(
                      listener: (context, state) {
                        if(state is LoginErrorState){
                          Fluttertoast.showToast(msg: state.message , backgroundColor: ColorManger.red);
                        }if(state is LoginSuccessState){
                          context.goNamed(AppRouter.home);
                        }
                      },
                      builder: (context, state) {
                        if(state is LoginLoadingState){
                          return LinearProgressIndicator();
                        }else {
                          return  MyButton(
                              onPressed: (){

                                if(_formKey.currentState?.validate()?? false){


                                  BlocProvider.of<LoginBloc>(context).add(LoginEventRequest(phone: _phoneNumberController.text, password: _passwordController.text));


                                }




                              },
                              text:  AppStrings().login);
                        }
                      },


                    ),
                    SizedBox(height: 12.h,),
                    Row(

                      children: [
                        Text( AppStrings().dontHaveAnAccount,
                          style :Theme.of(context).textTheme.displayMedium,
                        ),
                        TextButton(
                            onPressed: (){

                              context.goNamed(AppRouter.register);
                            },
                            child:Text(AppStrings().register.tr(),),)
                      ],
                    ),
                    SizedBox(height: 32.h,)

                  ],
                ),
              ),
            ),


          ),
      ),

    );
  }
}
