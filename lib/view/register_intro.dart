import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_string.dart';
import 'package:tec/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatefulWidget {
  const RegisterIntro({super.key});

  @override
  State<RegisterIntro> createState() => _RegisterIntroState();
}

class _RegisterIntroState extends State<RegisterIntro> {
  @override
  Widget build(BuildContext context) {
    //   var theme = Theme.of(context).textButtonTheme;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.tcbot, height: 100),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: MyStrings.welcom,
                      style: TextStyle(
                          color: SolidColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    _showEmailBottomSheet(context);
                  },
                  child: const Text(
                    'بزن بریم',
                  )),
            ]),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(MyStrings.enterEmaile,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: TextField(
                          onChanged: (value) {
                            isEmail(value);
                            print(
                                value + 'isEmail ' + isEmail(value).toString());
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: 'tecbloc@gmail.com',
                          )),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showCodeBottomSheet(context);
                        },
                        child: Text('ادامه')),
                  ]),
            ),
          );
        });
  }

  Future<dynamic> _showCodeBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(MyStrings.activateCode,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextField(
                          onChanged: (value) {
                            // isEmail(value);
                            // print(
                            //     value + 'isEmail ' + isEmail(value).toString());
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: '*****',
                          )),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => MyCats(),
                          ));
                        },
                        child: Text('ادامه')),
                  ]),
            ),
          );
        });
  }
}
