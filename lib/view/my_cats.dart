import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_string.dart';

class MyCats extends StatelessWidget {
  const MyCats({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SvgPicture.asset(
                Assets.images.tcbot,
                height: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: MyStrings.successfulRegistration,
                    style: TextStyle(
                        color: SolidColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: 'نام و نام خانوادگی '),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: MyStrings.chooseCats,
                    style: TextStyle(
                        color: SolidColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )),
        ),
      ),
    ));
  }
}
