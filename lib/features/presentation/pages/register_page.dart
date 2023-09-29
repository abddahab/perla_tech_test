import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/strings/app_strings.dart';
import 'package:perla_tech/features/presentation/widgets/my_button.dart';
import 'package:perla_tech/features/presentation/widgets/my_text_form_field.dart';

class RegisterPage extends StatefulWidget {

  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final  _passwordController = TextEditingController();

  final  _confirmPasswordController = TextEditingController();

  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                  Text(AppStrings().createAccount ,
                    style: Theme.of(context).textTheme.bodyLarge,),
                  SizedBox(height: 4.h,),
                  Text(
                    AppStrings().registerToGetStarted,
                    style:ThemeData.light().textTheme.bodyMedium,
                  ),
                  SizedBox(height: 48.h),
                  Text(
                      AppStrings().fullName,
                    style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: 12.h,),
                  MyTextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      validate: (value){
                        if(value!.isEmpty){
                          return AppStrings().yourNameCantBeEmpty;
                        }
                        return null;
                      },
                      lable: AppStrings().enterYourName,
                      prefix: Icons.account_circle
                  ),
                  SizedBox(height:24.h),
                  Text(
                    AppStrings().phoneNumber,
                    style: Theme.of(context).textTheme.labelMedium ,
                  ),
                  SizedBox(height: 12.h,),
                  MyTextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      validate: (value){
                        if(value!.isEmpty){
                          return  AppStrings().phoneNumberCantBeEmpty;
                        }
                        return null;
                      },
                      lable:  AppStrings().enterYourPhoneNumber,
                      prefix: Icons.phone
                  ),
                  SizedBox(height:24.h),
                  Text(
                    AppStrings().password,
                    style:Theme.of(context).textTheme.titleMedium,
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
                    isPassword: true ,
                    suffix:Icons.visibility_off,
                  ),
                  SizedBox(height:24.h),
                  Text(
                    AppStrings().confirmPassword,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(height: 12.h,),
                  MyTextFormField(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    validate: (value){
                      if(value!.isEmpty){
                        return  AppStrings().passwordCantBeEmpty;
                      }
                      return null;
                    },
                    lable: AppStrings().repeatYourPassword,
                    prefix: Icons.lock_outline,
                    isPassword: true ,
                    suffix:Icons.visibility_off,
                  ),
                  SizedBox(height: 158.h),
                  MyButton(
                    onPressed: (){},
                    text:  AppStrings().register),

                  SizedBox(height: 12.h,),
                  Row(
                    children: [
                      Text( AppStrings().alreadyHaveAnAccount,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextButton(
                          onPressed: (){},
                          child:Text (AppStrings().login)
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h,),

                ],
              ),
            ),
          ),


        ),
      ),

    );
  }
}
