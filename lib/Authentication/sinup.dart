import 'package:flutter/material.dart';

import 'package:evently/util.dart';
import 'package:provider/provider.dart';

import "../l10n/app_localizations.dart";

import '../Providers/settings_provider.dart';
import '../Providers/login_provider.dart';

import '../General Widgets/filled_text_button.dart';
import '../General Widgets/input_field.dart';
import '../General Widgets/vertical_separator.dart';
import '../General Widgets/link_text.dart';

import '../Main%20Screens/main_screen.dart';

import '../models/user.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatedPasswordController = TextEditingController();

  late String userName;

  String? emailError;
  String? passwordError;
  bool obscure = true;
  bool reObscure = true;


  void signup() async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      setting.user = UserModel.newUser(userID: credential.user!.uid, userName: userName);
      //setting.user = UserModel(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        passwordError = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        emailError = 'The account already exists for that email.';
      }
    } catch (e) {
      emailError = e.toString();
    }
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(create: (context)=>LoginProvider(),
    child: Scaffold(
      appBar: AppBar(
        title: Image.asset(
          evently,
          width: screenWidth(context) * 0.378666667,
          color: mainColor,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(screenWidth(context) * 0.04),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.createYourAccount,
                  style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                    color: setting.theme ? lightMainColor : darkMainText,
                    fontSize: 24,
                  ),
                ),
              ),
              VerticalSpacer(h: 24),
              InputField(
                iconPath: userIcon,
                hintText: AppLocalizations.of(context)!.enterYourName,
                validator: (v) {

                  if(v == null|| v.isEmpty){
                    return 'please enter name';
                  }
                  else{
                    userName = v;
                  }
                },
                controller: nameController,
              ),
              VerticalSpacer(h: 16),
              InputField(
                iconPath: emailIcon,
                hintText: AppLocalizations.of(context)!.enterYourEmail,
                validator: (v)=>emailError,
                controller: emailController,
              ),

              VerticalSpacer(h: 24),
              InputField(
                iconPath: emailIcon,
                hintText: AppLocalizations.of(context)!.enterYourPassword,
                validator: (v) =>passwordError,
                controller: passwordController,
                obscure: obscure,
                suffix: IconButton(icon: Icon(obscure?Icons.visibility_off_outlined:Icons.visibility_outlined),onPressed: ()=>setState(() {obscure = !obscure;}),),
              ),

              VerticalSpacer(h: 24),
              InputField(
                iconPath: emailIcon,
                hintText: AppLocalizations.of(context)!.enterYourPassword,
                validator: (v) {
                  if(repeatedPasswordController.text == passwordController.text){
                    return passwordError;
                  }
                  else{
                    return 'please reinter the password correctly';
                  }
                },
                controller: repeatedPasswordController,
                obscure: reObscure,
                suffix: IconButton(icon: Icon(reObscure?Icons.visibility_off_outlined:Icons.visibility_outlined),onPressed: ()=>setState(() {reObscure = !reObscure;}),),
              ),

              VerticalSpacer(h: 52),
              FilledTextButton(
                action: (){
                  signup();
                  if(_formKey.currentState!.validate()){
                    setting.saveUser();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                  }
                },
                text: AppLocalizations.of(context)!.signup,
              ),
              VerticalSpacer(h: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.alreadyHaveAnAccount,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: setting.theme?Color(0xff1c1c1c):darkSecText),),
                  LinkText(
                    text: AppLocalizations.of(context)!.login,
                    action: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              VerticalSpacer(h: 32),
              Row(
                spacing: widthOf(16, context),
                children: [
                  Expanded(child: Divider()),
                  Text(AppLocalizations.of(context)!.or,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:mainColor),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              VerticalSpacer(h: 24),

              FilledButton(
                  onPressed: () {},
                  style: Theme.of(context).filledButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStatePropertyAll(input),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(side: BorderSide(color: stroke),borderRadius: BorderRadiusGeometry.all(Radius.circular(16))),
                    ),
                    padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(widthOf(16, context))),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: widthOf(16, context),
                      children: [
                        Image.asset(googleIcon,height: heightOf(24, context),),
                        Text(
                          AppLocalizations.of(context)!.signUpWithGoogle,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
