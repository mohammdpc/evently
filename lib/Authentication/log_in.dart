import 'package:evently/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:evently/util.dart';

import "../l10n/app_localizations.dart";

import '../Providers/settings_provider.dart';

import '../General Widgets/filled_text_button.dart';
import '../General Widgets/input_field.dart';
import '../General Widgets/vertical_separator.dart';
import '../General Widgets/link_text.dart';

import 'sinup.dart';
import 'forget_password.dart';
import '../Main Screens/main_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  bool obscure = true;
  bool loading = true;
  Future<UserModel?> logIn() async {
    String? uid;
    UserModel tempUser;
    emailError = null;
    passwordError = null;
    if (!_formKey.currentState!.validate()) {
      return null;
    }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      uid = credential.user!.uid;
      debugPrint('\n\n Credintials done \n\n');
      final db = FirebaseFirestore.instance;
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await db
          .collection('users')
          .doc(uid)
          .get();
      Map<String, dynamic> data = documentSnapshot.data()!;
      debugPrint('\n\n DB done \n\n');

      tempUser = UserModel(
        userID: uid,
        userName: data['User Name'],
        events: data[''],
      );
      return tempUser;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        passwordError = 'Wrong password provided for that user.';
      } else {
        emailError = e.code;
      }
      debugPrint('\n\n ${e.code} \n\n');
      _formKey.currentState!.validate();
      return null;
    }

    //event structure in db:
    // e1{name index,

    /*
    data = data['events'];
    for (int i = 1; i <= data.length; i++) {
      events.add(
        Event(
          title: data[i.toString()]['Event Title'],
          description: data[i.toString()]['Event Description'],
          eventDateAndTime: data[i.toString()]['Event DateTime'],
          eventTypeIndex: data[i.toString()]['Event Type Index'],
          favourite: data[i.toString()]['Is Favourite'],
        ),
      );
    }*/
  }

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
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * 0.04,
          ),
          child: Column(
            children: [
              SizedBox(height: screenWidth(context) * 0.04),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.loginToYourAccount,
                  style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                    color: setting.theme ? lightMainColor : darkMainText,
                    fontSize: 24,
                  ),
                ),
              ),
              VerticalSpacer(h: 24),
              InputField(
                iconPath: emailIcon,
                hintText: AppLocalizations.of(context)!.enterYourEmail,
                validator: (v) {
                  RegExp reg = RegExp(
                    r"""(?:[a-z0-9!#$%&'*+\x2f=?^_`\x7b-\x7d~\x2d]+(?:\.[a-z0-9!#$%&'*+\x2f=?^_`\x7b-\x7d~\x2d]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9\x2d]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9\x2d]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9\x2d]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""",
                  );
                  if (v == null) {
                    return 'Email can\'t be empty';
                  } else if (!reg.hasMatch(v)) {
                    return 'Invalid Email';
                  } else if (emailError != null) {
                    return emailError;
                  }
                },
                controller: emailController,
              ),
              VerticalSpacer(h: 16),
              InputField(
                iconPath: passwordIcon,
                suffix: IconButton(
                  icon: Icon(
                    obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () => setState(() {
                    obscure = !obscure;
                  }),
                ),
                hintText: AppLocalizations.of(context)!.enterYourPassword,
                validator: (v) {
                  if (v == null) {
                    return 'Password can\'t be empty';
                  } else if (v.length < 6) {
                    return 'Password is too short';
                  } else if (passwordError != null) {
                    return passwordError;
                  }
                },
                controller: passwordController,
                obscure: obscure,
              ),
              VerticalSpacer(h: 8),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: LinkText(
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen(),
                      ),
                    );
                  },
                  text: AppLocalizations.of(context)!.forgetPassword,
                ),
              ),
              VerticalSpacer(h: 47),
              FilledTextButton(
                action: () async{
                  debugPrint(
                    'Email:${emailController.text} \n password: ${passwordController.text}',
                  );
                  final user = await logIn();

                  if (user == null) {
                    debugPrint('\n\n error \n\n');
                    return;
                  }
                  setting.user = user;
                  setting.saveUser();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );

                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     debugPrint('\n\nwaiting\n\n');
                  //     if (emailError != null || passwordError != null) {
                  //       debugPrint('\n\n error \n\n');
                  //       Navigator.pop(context);
                  //     } else if (tempUser != null &&
                  //         tempUser!.userName.isNotEmpty) {
                  //       setting.user = tempUser;
                  //       setting.saveUsre();
                  //       Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => MainScreen()),
                  //       );
                  //     }
                  //     return Center(
                  //       child: SizedBox(
                  //         width: widthOf(20, context),
                  //         height: widthOf(20, context),
                  //         child: CircularProgressIndicator(),
                  //       ),
                  //     );
                  //   },
                  // );
                },
                text: AppLocalizations.of(context)!.login,
              ),
              VerticalSpacer(h: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.doNotHaveAnAccount,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: setting.theme ? Color(0xff1c1c1c) : darkSecText,
                    ),
                  ),
                  LinkText(
                    text: AppLocalizations.of(context)!.signup,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                  ),
                ],
              ),
              VerticalSpacer(h: 32),
              Row(
                spacing: widthOf(16, context),
                children: [
                  Expanded(child: Divider()),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: mainColor,
                    ),
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
                    RoundedRectangleBorder(
                      side: BorderSide(color: stroke),
                      borderRadius: BorderRadiusGeometry.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  padding: WidgetStatePropertyAll(
                    EdgeInsetsGeometry.all(widthOf(16, context)),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: widthOf(16, context),
                    children: [
                      Image.asset(googleIcon, height: heightOf(24, context)),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
