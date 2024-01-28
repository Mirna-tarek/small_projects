import 'package:flutter/material.dart';
import '../model_onboarding.dart';

class onBoardingPageWidget extends StatelessWidget {
  const onBoardingPageWidget({
    Key? key,
    required this.model,
  }): super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      color: model.bgColor,
      child: Column(
        children: [
          SafeArea(child: Padding(
            padding: const EdgeInsets.all(16),
          )),
          Image(image: AssetImage(model.image) , height: model.height *0.5,),
          Column(
            children: [
              Text(model.title),
              const SizedBox(height: 12),
              Text(model.subTitle, textAlign: TextAlign.center,),
              const SizedBox(height: 50),
            ],
          )
        ],
      ),
    );
  }
}