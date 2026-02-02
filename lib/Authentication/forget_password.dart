import 'package:flutter/material.dart';
import '../util.dart';
import '../l10n/app_localizations.dart';
import '../Providers/settings_provider.dart';
import '../General Widgets/horizontal_separator.dart';
import '../General Widgets/filled_text_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.085333333,
                    height: screenWidth(context) * 0.085333333,
                    child: FilledButton(
                      style: Theme.of(context).filledButtonTheme.style!.copyWith(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: screenWidth(context) * 0.029333333,
                            vertical: screenHeight(context) * 0.009852217,
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(input),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(8),
                            ),
                            side: BorderSide(color: stroke),
                          ),
                        ),
                      ),
                      onPressed: ()=>Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: setting.theme ? mainColor : lightInput,
                        weight: screenWidth(context) * 0.018933333,
                      ),
                    ),
                  ),

                  Text(AppLocalizations.of(context)!.forgetPassword.substring(0,AppLocalizations.of(context)!.forgetPassword.length - 1),
                  style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(color:mainText),
                  ),

                  SizedBox(
                    width: screenWidth(context) * 0.168,
                    height: screenWidth(context) * 0.085333333,

                  ),
                ],
              ),
              Image.asset(forgotPasswordImage),
              HorizontalSpacer(h: 40),
              FilledTextButton(action: (){}, text: AppLocalizations.of(context)!.resetPassword)
            ],
          ),
        ),
      ),
    );
  }
}
