import 'package:flutter/material.dart';
import '../util.dart';
import '../l10n/app_localizations.dart';
import '../Providers/settings_provider.dart';
import '../General Widgets/vertical_separator.dart';
import '../General Widgets/filled_text_button.dart';
import '../General Widgets/custom_back_button.dart';

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
                  CustomBackButton(action: ()=>Navigator.pop(context),),

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
              VerticalSpacer(h: 40),
              FilledTextButton(action: (){}, text: AppLocalizations.of(context)!.resetPassword)
            ],
          ),
        ),
      ),
    );
  }
}
