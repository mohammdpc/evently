import 'package:flutter/material.dart';
import 'package:evently/util.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/Providers/settings_provider.dart';
import 'package:evently/General Widgets/setting_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: widthOf(16, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: heightOf(32, context)),
          CircleAvatar(
            backgroundImage: AssetImage(profileImage),
            radius: widthOf(104, context),
          ),
          SizedBox(height: heightOf(16, context)),
          Text(
            setting.userName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: mainText,
            ),
          ),
          SizedBox(height: heightOf(4, context)),
          Text(
            setting.userEmail,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: mainText,
            ),
          ),
          SizedBox(height: heightOf(32, context)),
          SettingTile(
            text: AppLocalizations.of(context)!.darkMode,
            action: SizedBox(
              width: widthOf(36, context),
              height: heightOf(20, context),
              child: Switch(
                thumbIcon: WidgetStatePropertyAll(
                  Icon(Icons.circle_rounded, size: 0),
                ),
                thumbColor: WidgetStatePropertyAll(input),
                trackOutlineWidth: WidgetStatePropertyAll(0),
                trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
                activeTrackColor: mainColor,
                value: !setting.theme,
                onChanged: (v) {
                  if (v) {
                    setting.themeToDark();
                    return;
                  }
                  setting.themeToLight();
                },
              ),
            ),
          ),
          SizedBox(height: heightOf(16, context)),
          SettingTile(
            text: AppLocalizations.of(context)!.language,
            action: InkWell(
              onTap: () => setting.languageSwitch(),
              child: Icon(Icons.arrow_forward_ios_rounded, color: mainColor),
            ),
          ),
          SizedBox(height: heightOf(16, context)),
          SettingTile(
            text: AppLocalizations.of(context)!.logOut,
            action: InkWell(
              onTap: ()=>setting.deleteUser(context),
              child: Image.asset(logoutIcon, width: widthOf(24, context)),
            ),
          ),
        ],
      ),
    );
  }
}
