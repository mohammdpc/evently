import 'package:flutter/material.dart';

import 'package:evently/util.dart';

import "../l10n/app_localizations.dart";

import '../Providers/settings_provider.dart';

import '../General Widgets/filled_text_button.dart';
import '../General Widgets/input_field.dart';
import '../General Widgets/horizontal_separator.dart';
import '../General Widgets/link_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              HorizontalSpacer(h: 24),
              InputField(
                iconPath: userIcon,
                hintText: AppLocalizations.of(context)!.enterYourName,
                validator: (v) {},
              ),
              HorizontalSpacer(h: 16),
              InputField(
                iconPath: emailIcon,
                suffix: Icon(Icons.visibility_off_outlined),
                hintText: AppLocalizations.of(context)!.enterYourName,
                validator: (v) {},
              ),

              HorizontalSpacer(h: 24),
              InputField(
                iconPath: emailIcon,
                hintText: AppLocalizations.of(context)!.enterYourPassword,
                validator: (v) {},
              ),

              HorizontalSpacer(h: 24),
              InputField(
                iconPath: emailIcon,
                hintText: AppLocalizations.of(context)!.enterYourPassword,
                validator: (v) {},
              ),

              HorizontalSpacer(h: 52),
              FilledTextButton(
                action: () {},
                text: AppLocalizations.of(context)!.signup,
              ),
              HorizontalSpacer(h: 48),
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
              HorizontalSpacer(h: 32),
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
              HorizontalSpacer(h: 24),

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
    );
  }
}
